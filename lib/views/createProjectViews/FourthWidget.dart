import 'package:flutter/material.dart';
import 'package:fromzero_app/models/project_model.dart';

class ShowProjectData extends StatelessWidget {
  final CreateProjectData projectData;

  const ShowProjectData({
    super.key,
    required this.projectData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.projectData.name,
          style: TextStyle(fontSize: 25),
        ),
        Text(
          this.projectData.type.name,
          style: TextStyle(fontSize: 25),
        ),
        Text(
          this.projectData.description,
          style: TextStyle(fontSize: 20),
        ),
        Row(
          children: [
            Text(
              "Presupuesto: ",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              this.projectData.budget.toString() +
                  " " +
                  this.projectData.currency.name,
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
        Text(
          "Lenguajes y tecnologías:",
          style: TextStyle(fontSize: 25),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: this.projectData.languages.map((language) {
                    return Text(
                      language.name,
                      style: TextStyle(fontSize: 25),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: this.projectData.frameworks.map((framework) {
                    return Text(
                      framework.name,
                      style: TextStyle(fontSize: 25),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
        Text(
          "Metodologías:",
          style: TextStyle(fontSize: 25),
        ),
        !this.projectData.methodologies.isEmpty
            ? Container(
                child: Column(
                  children: this.projectData.methodologies.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          item.description,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              )
            : Text(
                "Se elegirán metodologías en base al tipo de proyecto elegido",
                style: TextStyle(fontSize: 20),
              ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Crear Proyecto",
                  style: TextStyle(fontSize: 25.0, color: Colors.white)),
              onPressed: () {}),
        )
      ],
    );
  }
}
