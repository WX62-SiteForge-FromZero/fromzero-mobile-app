import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/project_model.dart';

class ShowProjectData extends StatelessWidget {
  final CreateProjectData projectData;
  //final Function(int) onUpdateSection;
  const ShowProjectData(
      {
        super.key,
        required this.projectData,
        /*required this.onUpdateSection*/});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.projectData.name),
        Text(this.projectData.description),
        Text(this.projectData.budget.toString()+this.projectData.currency.name),
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
        ),
        Container(
          color: Colors.teal,
          child: Column(
            children: this.projectData.methodologies.map((item){
              return Column(
                children: [
                  Text(item.name),
                  Text(item.description),
                  Text("--------")
                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
