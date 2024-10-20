import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/project_model.dart';

class ProjectDetailsWidget extends StatelessWidget {
  final CreateProjectData projectData = CreateProjectData();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final Function(CreateProjectData) onUpdatedProjectData;
  final Function(int) onUpdateSection;

  ProjectDetailsWidget(
      {super.key,
      required this.onUpdatedProjectData,
      required this.onUpdateSection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Nombre del proyecto",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(),
            keyboardType: TextInputType.text,
          )
        ]),
        const SizedBox(height: 80),
        Column(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Descripcion del proyecto",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          TextFormField(
            controller: descController,
            decoration: const InputDecoration(),
            keyboardType: TextInputType.text,
          )
        ]),
        const SizedBox(height: 80),
        ProjectTypeWidget(
          onTypeChanged: (ProjectType? newType) {
            projectData.type = newType!;
          },
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
                onUpdateSection(2);
              }),
        )
      ],
    );
  }
}

class ProjectTypeWidget extends StatefulWidget {
  final ValueChanged<ProjectType?> onTypeChanged;

  const ProjectTypeWidget({super.key, required this.onTypeChanged});

  @override
  State<ProjectTypeWidget> createState() => _ProjectTypeWidgetState();
}

class _ProjectTypeWidgetState extends State<ProjectTypeWidget> {
  ProjectType? _type = ProjectType.LANDING_PAGE;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Tipo de proyecto", style: TextStyle(fontSize: 20.0)),
        ),
        RadioListTile(
            title: const Text("Landing Page"),
            value: ProjectType.LANDING_PAGE,
            groupValue: _type,
            onChanged: (ProjectType? value) {
              setState(() {
                _type = value;
              });
              widget.onTypeChanged(value);
            }),
        RadioListTile(
            title: const Text("Aplicación Web"),
            value: ProjectType.WEB_APPLICATION,
            groupValue: _type,
            onChanged: (ProjectType? value) {
              setState(() {
                _type = value;
              });
              widget.onTypeChanged(value);
            }),
        RadioListTile(
            title: const Text("Aplicación de Escritorio"),
            value: ProjectType.DESKTOP_APPLICATION,
            groupValue: _type,
            onChanged: (ProjectType? value) {
              setState(() {
                _type = value;
              });
              widget.onTypeChanged(value);
            }),
        RadioListTile(
            title: const Text("Aplicación Móvil"),
            value: ProjectType.MOBILE_APPLICATION,
            groupValue: _type,
            onChanged: (ProjectType? value) {
              setState(() {
                _type = value;
              });
              widget.onTypeChanged(value);
            })
      ],
    );
  }
}
