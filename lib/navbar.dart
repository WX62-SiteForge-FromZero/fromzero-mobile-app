import 'package:flutter/material.dart';
import 'package:fromzero_app/prefs/user_prefs.dart';
import 'package:fromzero_app/views/ProfileWidget/MenuWidget.dart';
import 'package:fromzero_app/views/ProfileWidget/ProfileWidget.dart';
import 'package:fromzero_app/views/applyToProjectViews/ListProjects.dart';
import 'package:fromzero_app/views/createProjectViews/CreateProjectWidget.dart';
import 'package:fromzero_app/views/searchProjectsViews/ProjectMainList.dart';

class Navbar extends StatefulWidget {
  final VoidCallback toggleLogin;
  const Navbar({super.key, required this.toggleLogin});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedView = 0;
  String role = "";

  Future<void> setUser()async{
    Map<String,String> userData = await loadData();
    setState(() {
      role=userData['role']!;

    });
  }

  @override
  void initState() {
    super.initState();
    setUser();
  }

  void setView(int view) {
    setState(() {
      selectedView = view;
    });
  }

  Text setViewTitle() {

    if(role=="COMPANY") {
      switch (selectedView) {
        case 0:
          return const Text(
            "Perfil",
            style: TextStyle(fontSize: 35),
          );
        case 1:
          return const Text(
            "Buscar Desarrolladores",
            style: TextStyle(fontSize: 35),
          );
        case 2:
          return const Text(
            "Proyectos Destacados",
            style: TextStyle(fontSize: 35),
          );
        default:
          return const Text(
            "Crear Proyecto",
            style: TextStyle(fontSize: 35),
          );
      }
    }else{
      // DEVELOPER
      switch (selectedView) {
        case 0:
          return const Text(
            "Perfil",
            style: TextStyle(fontSize: 35),
          );
        case 1:
          return const Text(
            "Buscar Proyectos",
            style: TextStyle(fontSize: 35),
          );
        /*case 2:
          return const Text(
            "Proyectos Destacados",
            style: TextStyle(fontSize: 35),
          );*/
        default:
          return const Text(
            "Proyectos Destacados",
            style: TextStyle(fontSize: 35),
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> views =[];

    if(role=="COMPANY"){
      setState(() {
        views = [
          const ProfileWidget(),
          const DeveloperListScreen(),
          //const ApplyToProjects(),
          const Center(child: Text("Destacados")),
          const CreateProjectApp(),
        ];
      });
    }else {
      setState(() {
        views = [
          const ProfileWidget(),
          //const DeveloperListScreen(),
          const ApplyToProjects(),
          const Center(child: Text("Destacados")),
          //const CreateProjectApp(),
        ];
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: Builder(
            builder: (BuildContext aContext){
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){
                  Scaffold.of(aContext).openDrawer();
                },
              );
            }
        ),
        title: setViewTitle(),
      ),
      drawer: MenuWidget(toggleLogin: widget.toggleLogin,),
      body: IndexedStack(
        index: selectedView,
        children: views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedView,
        onTap: (index) {
          setState(() {
            selectedView = index;
          });
        },
        items: (role=="COMPANY")?[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Destacados",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_file_rename_outline),
            label: "Publicar",
          ),
        ]:[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Destacados",
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.drive_file_rename_outline),
            label: "Publicar",
          ),*/
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}
