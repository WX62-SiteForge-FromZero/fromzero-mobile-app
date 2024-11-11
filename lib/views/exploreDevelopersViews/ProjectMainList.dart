import 'package:flutter/material.dart';
import 'package:fromzero_app/api/profilesService.dart';
import 'package:fromzero_app/models/developer_model.dart';
import 'package:fromzero_app/views/exploreDevelopersViews/previewDevelopers.dart';

class DeveloperListScreen extends StatefulWidget {
  const DeveloperListScreen({super.key});

  @override
  State<DeveloperListScreen> createState() => _DeveloperListScreenState();
}

class _DeveloperListScreenState extends State<DeveloperListScreen> {
  List<Developer> developers = [];

  @override
  void initState() {
    super.initState();
    fetchDevelopers();
  }

  Future<void> fetchDevelopers() async {
    var service = ProfilesService();
    final response = await service.getAllDevelopers();
    setState(() {
      developers=response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: developers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: developers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(developers[index].profileImgUrl),
                radius: 30,
              ),
              title: Text(
                '${developers[index].firstName} ${developers[index].lastName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Proyectos Completados: ${developers[index].completedProjects}',
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewDeveloper(developer: developers[index]),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Ver perfil',style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      ),
    );
  }
}
