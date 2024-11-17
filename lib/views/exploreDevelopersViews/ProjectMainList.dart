import 'package:flutter/material.dart';
import 'package:fromzero_app/api/profilesService.dart';
import 'package:fromzero_app/models/company_model.dart';
import 'package:fromzero_app/models/developer_model.dart';
import 'package:fromzero_app/views/exploreDevelopersViews/previewDevelopers.dart';

class DeveloperListScreen extends StatefulWidget {
  final Company currentUser;
  const DeveloperListScreen({
    super.key,
    required this.currentUser
  });

  @override
  State<DeveloperListScreen> createState() => _DeveloperListScreenState();
}

class _DeveloperListScreenState extends State<DeveloperListScreen> {
  List<Developer> developers = [];
  List<Developer> filteredDevelopers = [];
  String searchQuery = '';
  String selectedCountry = 'All';
  String selectedSpecialty = 'All';
  List<String> countries = ['All'];

  @override
  void initState() {
    super.initState();
    fetchDevelopers();
  }

  Future<void> fetchDevelopers() async {
    var service = ProfilesService();
    final response = await service.getAllDevelopers();
    setState(() {
      developers = response;
      filteredDevelopers = response;
      countries.addAll(response.map((dev) => dev.country).toSet().toList());
    });
  }

  void filterDevelopers() {
    setState(() {
      filteredDevelopers = developers.where((developer) {
        final matchesSearchQuery = developer.specialties.toLowerCase().contains(searchQuery.toLowerCase());
        final matchesCountry = selectedCountry == 'All' || developer.country == selectedCountry;
        final matchesSpecialty = selectedSpecialty == 'All' || developer.specialties.contains(selectedSpecialty);
        return matchesSearchQuery && matchesCountry && matchesSpecialty;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developers'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search by specialties',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                searchQuery = value;
                filterDevelopers();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                        filterDevelopers();
                      });
                    },
                    items: countries.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedSpecialty,
                    onChanged: (value) {
                      setState(() {
                        selectedSpecialty = value!;
                        filterDevelopers();
                      });
                    },
                    items: <String>['All', 'Flutter', 'React', 'Node.js', 'Python']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredDevelopers.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: filteredDevelopers.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(filteredDevelopers[index].profileImgUrl),
                      radius: 30,
                    ),
                    title: Text(
                      '${filteredDevelopers[index].firstName} ${filteredDevelopers[index].lastName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      'Proyectos Completados: ${filteredDevelopers[index].completedProjects}',
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PreviewDeveloper(developer: filteredDevelopers[index], currentUser: widget.currentUser),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Ver perfil', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}