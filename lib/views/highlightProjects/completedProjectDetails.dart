import 'package:flutter/material.dart';
import 'package:fromzero_app/models/project_model.dart';

class CompletedProjectDetails extends StatelessWidget {
  final Project project;
  const CompletedProjectDetails({
    super.key,
    required this.project
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del proyecto"),
      ),
      body: Column(
        children: [
          Text(project.name),
          Text("Descripción"),
          Text(project.description),
          Text("Presupuesto: ${project.budget}"),
          Text("Tecnologías"),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: project.languages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              project.languages[index],
                              textAlign: TextAlign.center,
                            ),
                          );
                        })),
                Expanded(
                    child: ListView.builder(
                        itemCount: project.frameworks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              project.frameworks[index],
                              textAlign: TextAlign.center,
                            ),
                          );
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
