import 'package:flutter/material.dart';
import 'package:fromzero_company_app/views/createProjectViews/CreateProjectToolbar.dart';
import 'package:fromzero_company_app/views/createProjectViews/SecondWidget.dart';
import 'package:fromzero_company_app/models/project_model.dart';

class CreateProjectApp extends StatelessWidget {
  final CreateProjectData projectData = CreateProjectData();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  CreateProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateProjectToolbar(),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nombre del proyecto",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(),
                  keyboardType: TextInputType.text,
                )
              ]),
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Descripcion del proyecto",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(),
                  keyboardType: TextInputType.text,
                )
              ]),
              ProjectTypeWidget()
            ],
          )),
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text("Siguiente",
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: () {
            projectData.name = nameController.text;
            projectData.description = descController.text;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProjectLanguagesWidget(projectData: projectData)));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ProjectTypeWidget extends StatefulWidget {
  const ProjectTypeWidget({super.key});

  @override
  State<ProjectTypeWidget> createState() => _ProjectTypeWidgetState();
}

class _ProjectTypeWidgetState extends State<ProjectTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

