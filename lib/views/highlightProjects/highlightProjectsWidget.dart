import 'package:flutter/material.dart';
import 'package:fromzero_app/api/projectsService.dart';
import 'package:fromzero_app/views/highlightProjects/completedProjectDetails.dart';

import '../../models/project_model.dart';

class HighlightProjects extends StatelessWidget {
  const HighlightProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Botones y buscar"),
            Expanded(
                child: CompletedProjectsList()
            )
          ],
        ),
      ),
    );
  }
}

class CompletedProjectsList extends StatefulWidget {
  const CompletedProjectsList({super.key});

  @override
  State<CompletedProjectsList> createState() => _CompletedProjectsListState();
}

class _CompletedProjectsListState extends State<CompletedProjectsList> {
  List<Project> projects=[];

  Future<void> fetchProjects()async{
    try{
      var service = ProjectsService();
      List<Project> response = await service.getAllProjectsByState("COMPLETADO");
      setState(() {
        projects=response;
      });
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return projects.length!=0?ListView.builder(
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(
              projects[index].name,
              textAlign: TextAlign.center,
            ),
            subtitle: Column(
              children: [
                Text(
                  projects[index].type,
                  textAlign: TextAlign.center
                ),
                Text(projects[index].description)
              ],
            ),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>CompletedProjectDetails(
                          project: projects[index]
                      )
                  )
              );
            },
          );
        }
    ):Text(
      "Aún no hay proyectos completados",
      textAlign: TextAlign.center,
    );
  }
}

