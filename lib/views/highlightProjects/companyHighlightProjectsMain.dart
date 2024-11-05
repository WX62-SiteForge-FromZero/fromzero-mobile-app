import 'package:flutter/material.dart';
import '../../api/projectsService.dart';
import '../../models/project_model.dart'; // Asegúrate de que el nombre del archivo coincida
import 'package:fromzero_app/views/highlightProjects/companyHighlightProjectView.dart';

class CompanyHighlightProjectsMain extends StatefulWidget {
  const CompanyHighlightProjectsMain({Key? key}) : super(key: key);

  @override
  State<CompanyHighlightProjectsMain> createState() => _CompanyHighlightProjectsMainState();
}

class _CompanyHighlightProjectsMainState extends State<CompanyHighlightProjectsMain> {
  final ProjectsService projectsService = ProjectsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyectos de Compañías'),
      ),
      body: FutureBuilder<List<Project>>(
        future: projectsService.getAllProjectsByState('En progreso'), // Llama al servicio para obtener proyectos
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Indicador de carga
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Manejo de errores
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay proyectos disponibles.')); // Sin proyectos
          }

          // Si tenemos proyectos, los mostramos en una lista
          final List<Project> projects = snapshot.data!;
          return ListView.builder(
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
                        builder: (context) => CompanyHighlightProjectView(project: project),
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
          );
        },
      ),
    );
  }
}
