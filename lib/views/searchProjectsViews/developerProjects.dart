import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeveloperProjectsScreen extends StatefulWidget {
  final int developerId;

  const DeveloperProjectsScreen({Key? key, required this.developerId})
      : super(key: key);

  @override
  _DeveloperProjectsScreenState createState() =>
      _DeveloperProjectsScreenState();
}

class _DeveloperProjectsScreenState extends State<DeveloperProjectsScreen> {
  List projects = [];

  @override
  void initState() {
    super.initState();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/projects?developer.id=${widget.developerId}'),
      );

      if (response.statusCode == 200) {
        setState(() {
          projects = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load projects');
      }
    } catch (e) {
      print('Error fetching projects: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Proyectos'),
        elevation: 0,
      ),
      body: projects.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.network(
                project['company']['profileImgUrl'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                project['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text('Estado: ${project['state']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectDetailScreen(project: project),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Review'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProjectDetailScreen extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetailScreen({Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(project['name']),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              project['company']['profileImgUrl'],
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              project['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Lenguajes: ${project['languages'].join(", ")}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Frameworks: ${project['frameworks'].join(", ")}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Presupuesto: ${project['budget']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Regresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
