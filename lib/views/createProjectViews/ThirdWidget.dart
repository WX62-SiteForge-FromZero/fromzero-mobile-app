import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/project_model.dart';

class MethodologiesWidget extends StatelessWidget {
  final CreateProjectData projectData;
  final Function(CreateProjectData) onUpdatedProjectData;
  final Function(int) onUpdateSection;

  const MethodologiesWidget(
      {super.key,
      required this.projectData,
      required this.onUpdatedProjectData,
      required this.onUpdateSection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.projectData.name),
        Text(this.projectData.description),
        Text(this.projectData.type.name),
        Container(
          color: Colors.lightBlue,
          child: Column(
            children: this.projectData.languages.map((language) {
              return Text(language.name);
            }).toList(),
          ),
        ),
        Container(
          color: Colors.orange,
          child: Column(
            children: this.projectData.frameworks.map((framework) {
              return Text(framework.name);
            }).toList(),
          ),
        )
      ],
    );
  }
}
