import 'package:flutter/material.dart';
import 'package:fromzero_app/api/projectsService.dart';
import 'package:fromzero_app/views/ProfileWidget/AcceptDeveloperWidget.dart';
import 'package:fromzero_app/views/deliverableViews/DeliverablesWidget.dart';

import '../../models/project_model.dart';

class YourProjectsDevWidget extends StatefulWidget {

  const YourProjectsDevWidget({super.key});

  @override
  State<YourProjectsDevWidget> createState() => _YourProjectsDevWidgetState();
}

class _YourProjectsDevWidgetState extends State<YourProjectsDevWidget> {
  List<Project> projectList =[];
  Future<void> fetchProjectsByProfileId()async{
    var service = ProjectsService();
    final response = await service.getProjectsByDeveloperId();
    setState(() {
      projectList=response;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProjectsByProfileId();
  }

  void checkDeliverables(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>
                DeliverablesSchedule()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tus proyectos"),
      ),
      body: projectList.length!=0?ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(projectList[index].name,textAlign: TextAlign.center,),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(projectList[index].description),
                    const SizedBox(height: 10),
                    Text("Progreso: ${projectList[index].progress}%")
                  ],
                ),
                tileColor: Colors.grey[300],
                onTap: (){
                  checkDeliverables(context);
                }
            );
          }
      ):Text("Aún están evaluando tu postulación",textAlign: TextAlign.center,),
    );
  }


}

