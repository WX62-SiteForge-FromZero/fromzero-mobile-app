import 'package:flutter/material.dart';
import '../../models/project_model.dart';
import 'companyInfoView.dart';

class CompanyHighlightProjectView extends StatelessWidget {
  final Project project;

  const CompanyHighlightProjectView({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título del proyecto
            Text(
              project.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Título de la descripción
            const Text(
              'Descripción:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            // Descripción del proyecto
            Text(
              project.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Título del estado del proyecto
            const Text(
              'Estado:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              project.state,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Título del progreso del proyecto
            const Text(
              'Progreso:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${(project.progress * 100).toStringAsFixed(0)}%',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(), // Empuja el botón hacia abajo
            // Botón para ir a CompanyInfoView, centrado
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyInfoView(companyId: project.companyId),
                    ),
                  );
                },
                child: const Text('Compañía'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
