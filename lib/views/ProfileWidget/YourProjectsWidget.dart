import 'package:flutter/material.dart';
import 'package:fromzero_app/api/projectsService.dart';
import 'package:fromzero_app/views/ProfileWidget/AcceptDeveloperWidget.dart';
import 'package:fromzero_app/views/deliverableViews/DeliverablesWidget.dart';

import '../../models/project_model.dart';

class YourProjectsWidget extends StatefulWidget {

  const YourProjectsWidget({super.key});

  @override
  State<YourProjectsWidget> createState() => _YourProjectsWidgetState();
}

class _YourProjectsWidgetState extends State<YourProjectsWidget> {
  List<Project> projectList =[];
  Future<void> fetchProjectsByProfileId()async{
    var service = ProjectsService();
    final response = await service.getProjectByCompanyId();
    setState(() {
      projectList=response;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProjectsByProfileId();
  }

  void checkDeliverables(BuildContext context,int projectId){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>
                DeliverablesSchedule(projectId: projectId,)
        )
    );
  }

  void checkDevelopers(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>
                AcceptDeveloperWidget()
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
                    projectList[index].candidates.length!=0?ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // Acción del botón
                        checkDevelopers(context);
                      },
                      child: Text("Ver candidatos"),
                    ):Text("Progreso: ${projectList[index].progress}%"),
                  ],
                ),
                tileColor: Colors.grey[300],
                onTap: (){
                  checkDeliverables(context,projectList[index].id);
                }
            );
          }
      ):Text("Aún no has publicado proyectos",textAlign: TextAlign.center,),
    );
  }


}

