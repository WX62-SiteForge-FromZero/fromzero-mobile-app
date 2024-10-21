import 'package:flutter/material.dart';
import 'package:fromzero_company_app/views/createProjectViews/FirstWidget.dart';
import 'package:fromzero_company_app/views/createProjectViews/FourthWidget.dart';
import 'package:fromzero_company_app/views/createProjectViews/SecondWidget.dart';
import 'package:fromzero_company_app/views/createProjectViews/ThirdWidget.dart';
import '../../models/project_model.dart';

class CreateProjectApp extends StatefulWidget {
  const CreateProjectApp({super.key});

  @override
  State<CreateProjectApp> createState() => _CreateProjectAppState();
}

class _CreateProjectAppState extends State<CreateProjectApp> {
  int currentSection = 1;
  CreateProjectData projectData = CreateProjectData();

  void updateProjectData(CreateProjectData updatedData) {
    setState(() {
      projectData = updatedData;
    });
  }

  void updateCurrentSection(int newSection) {
    setState(() {
      currentSection = newSection;
    });
  }

  Widget currentWidget() {
    if (currentSection == 1) {
      return ProjectDetailsWidget(
          projectData: projectData,
          onUpdatedProjectData: updateProjectData,
          onUpdateSection: updateCurrentSection);
    } else if (currentSection == 2) {
      return ProjectTechnologiesWidget(
          projectData: projectData,
          onUpdatedProjectData: updateProjectData,
          onUpdateSection: updateCurrentSection);
    } else if (currentSection == 3) {
      return MethodologiesWidget(
          projectData: projectData,
          onUpdatedProjectData: updateProjectData,
          onUpdateSection: updateCurrentSection);
    } else if (currentSection == 4) {
      return ShowProjectData(projectData: projectData);
    } else {
      return Container(child: Center(child: Text("Error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear proyecto", style: TextStyle(fontSize: 40.0)),
        backgroundColor: Colors.lightBlue,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    currentSection != 1
                        ? IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              if (currentSection <= 4 && currentSection != 1) {
                                setState(() {
                                  currentSection--;
                                });
                              }
                            })
                        : Container(),
                    Text(
                      "Detalles del proyecto",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          child: currentWidget(),
        ),
      ),
    );
  }
}
