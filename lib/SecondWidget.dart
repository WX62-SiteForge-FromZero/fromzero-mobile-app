import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/models.dart';
class ProjectTypeWidget extends StatelessWidget {
  final CreateProjectData projectData;
  const ProjectTypeWidget({super.key,required this.projectData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear proyecto", style: TextStyle(fontSize: 25.0)),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detalles del proyecto",
                  style: TextStyle(fontSize: 10.0),
                ),
                /*IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back))*/
              ],
            )),
      ),
      body: Center(
        child: Column(
          children: [
            Text(this.projectData.name),
            Text(this.projectData.description)
          ],
        ),
      ),
    );
  }
}
