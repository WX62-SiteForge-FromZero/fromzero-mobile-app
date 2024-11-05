import 'package:flutter/material.dart';
import '../../models/project_model.dart'; // Asegúrate de que el nombre del archivo coincida
import 'package:fromzero_app/views/highlightProjects/developerHighlightProjectView.dart';

class DeveloperHighlightProjectsMain extends StatefulWidget {
  const DeveloperHighlightProjectsMain({Key? key}) : super(key: key);

  @override
  State<DeveloperHighlightProjectsMain> createState() => _DeveloperHighlightProjectsMainState();
}

class _DeveloperHighlightProjectsMainState extends State<DeveloperHighlightProjectsMain> {
  final List<Project> projects = [
    Project(1, 'Proyecto 1', 'Descripción del proyecto 1', 'En progreso', 0.5, 1, 2, [], [], [], 'Tipo A', '1000'),
    Project(2, 'Proyecto 2', 'Descripción del proyecto 2', 'Finalizado', 1.0, 1, 3, [], [], [], 'Tipo B', '2000'),
    Project(3, 'Proyecto 3', 'Descripción del proyecto 3', 'Pendiente', 0.3, 1, 4, [], [], [], 'Tipo C', '1500'),
    // ... más proyectos
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeveloperHighlightProjectView(project: project),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.network(
                      'https://via.placeholder.com/150', // Imagen de marcador de posición
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            project.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Estado: ${project.state}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Progreso: ${(project.progress * 100).toStringAsFixed(0)}%',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

