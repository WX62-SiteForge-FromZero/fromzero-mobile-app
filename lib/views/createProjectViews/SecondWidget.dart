import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/project_model.dart';
import 'package:fromzero_company_app/views/createProjectViews/CreateProjectToolbar.dart';
class ProjectLanguagesWidget extends StatelessWidget {
  final CreateProjectData projectData;
  const ProjectLanguagesWidget({super.key,required this.projectData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateProjectToolbar(),
      body: Center(
        child: Column(
          children: [
            Text(this.projectData.name),
            Text(this.projectData.description),
            Text(this.projectData.type.name)
          ],
        ),
      ),
    );
  }
}
