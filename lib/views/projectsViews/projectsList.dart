import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/projectsService.dart';
import '../../models/project_model.dart';
import '../ProfileWidget/AcceptDeveloperWidget.dart';
import '../deliverableViews/DeliverablesWidget.dart';

class ProjectsList extends StatefulWidget {
  const ProjectsList({super.key});

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {

  String role="";
  List<Project> projectList =[];

  Future<void> _fetchProjects()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      role = prefs.getString("role")??"";
      if(role == "COMPANY"){
        var service = ProjectsService();
        final response = await service.getProjectsByCompanyId();
        setState(() {
          projectList=response;
        });
      }else if(role == "DEVELOPER"){
        var service = ProjectsService();
        final response = await service.getProjectsByDeveloperId();
        setState(() {
          projectList=response;
        });
      }else{
        throw Exception("Rol desconocido");
      }
    }catch(e){
        throw Exception("$e");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProjects();
  }


  void checkDeliverables(BuildContext context,int projectId){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>
                DeliverablesSchedule(
                  projectId: projectId,
                  role: role,
                )
        )
    );
  }

  void checkDevelopers(BuildContext context,int projectId,List<dynamic> candidates){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>
                AcceptDeveloperWidget(
                  projectId: projectId,
                  candidates: candidates,
                  refreshProjects: (){
                    _fetchProjects();
                  },
                )
        )
    );
  }

  ListView _listProjects(){

    if(role=="COMPANY"){
      return ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
                title: Text(projectList[index].name,textAlign: TextAlign.center,),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(projectList[index].description),
                    const SizedBox(height: 10),
                    projectList[index].developerId==""?ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        checkDevelopers(
                            context,
                            projectList[index].id,
                            projectList[index].candidates
                        );
                      },
                      child: Text("Ver candidatos"),
                    ):Text("Progreso: ${projectList[index].progress}%")
                  ],
                ),
                tileColor: Colors.grey[300],
                onTap: (){
                  checkDeliverables(context,projectList[index].id);
                }
            );
          }
      );
    }else if(role=="DEVELOPER"){
      return ListView.builder(
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
                  checkDeliverables(context,projectList[index].id);
                }
            );
          }
      );
    }else {
      return emptyProjects();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tus proyectos"),
      ),
      body: projectList.length!=0?_listProjects():emptyProjects(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.lightBlueAccent,
          onPressed: (){
            _fetchProjects();
          }
      ),
    );
  }

  ListView emptyProjects(){
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text("Proyecto vacío"),
          );
        }
    );
  }

}
