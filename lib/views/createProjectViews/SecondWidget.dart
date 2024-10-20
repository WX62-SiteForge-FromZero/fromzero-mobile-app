import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/project_model.dart';

class ProjectTechnologiesWidget extends StatelessWidget {
  final CreateProjectData projectData;

  final Function(CreateProjectData) onUpdatedProjectData;
  final Function(int) onUpdateSection;

  const ProjectTechnologiesWidget(
      {super.key,
      required this.projectData,
      required this.onUpdatedProjectData,
      required this.onUpdateSection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lenguajes de programación",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            LanguagesWidget(onLanguageSelected: (Languages? addLanguage) {
              if (!projectData.languages.contains(addLanguage)) {
                projectData.languages.add(addLanguage!);
              }
            })
          ],
        ),
        const SizedBox(height: 80),
        Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Frameworks",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            FrameworksWidget(onFrameworkSelected: (Frameworks? addFramework) {
              if (!projectData.frameworks.contains(addFramework)) {
                projectData.frameworks.add(addFramework!);
              }
            })
          ],
        ),
        const SizedBox(height: 80),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Siguiente",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              onPressed: () {
                onUpdatedProjectData(projectData);
                onUpdateSection(3);
              }),
        )
      ],
    );
  }
}

class LanguagesWidget extends StatefulWidget {
  final ValueChanged<Languages?> onLanguageSelected;

  const LanguagesWidget({super.key, required this.onLanguageSelected});

  @override
  State<LanguagesWidget> createState() => _LanguagesWidgetState();
}

class _LanguagesWidgetState extends State<LanguagesWidget> {
  Languages? _language;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        menuMaxHeight: 150,
        menuWidth: double.infinity,
        hint: Text("Selecciona un lenguaje"),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        items: Languages.values
            .map<DropdownMenuItem<Languages>>((Languages value) {
          return DropdownMenuItem<Languages>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
        onChanged: (Languages? value) {
          setState(() {
            this._language = value;
          });
          widget.onLanguageSelected(value);
        });
  }
}

class FrameworksWidget extends StatefulWidget {
  final ValueChanged<Frameworks?> onFrameworkSelected;

  const FrameworksWidget({super.key, required this.onFrameworkSelected});

  @override
  State<FrameworksWidget> createState() => _FrameworksWidgetState();
}

class _FrameworksWidgetState extends State<FrameworksWidget> {
  Frameworks? _framework;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        menuMaxHeight: 150,
        menuWidth: double.infinity,
        hint: Text("Selecciona un framework"),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        items: Frameworks.values
            .map<DropdownMenuItem<Frameworks>>((Frameworks value) {
          return DropdownMenuItem<Frameworks>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
        onChanged: (Frameworks? value) {
          setState(() {
            this._framework = value;
          });
          widget.onFrameworkSelected(value);
        });
  }
}
