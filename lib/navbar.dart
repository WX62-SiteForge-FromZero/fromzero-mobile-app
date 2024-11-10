import 'package:flutter/material.dart';
import 'package:fromzero_app/api/profilesService.dart';
import 'package:fromzero_app/prefs/authProvider.dart';
import 'package:fromzero_app/views/ProfileWidget/MenuWidget.dart';
import 'package:fromzero_app/views/ProfileWidget/ProfileDevWidget.dart';
import 'package:fromzero_app/views/ProfileWidget/ProfileWidget.dart';
import 'package:fromzero_app/views/applyToProjectViews/ListProjects.dart';
import 'package:fromzero_app/views/createProjectViews/CreateProjectWidget.dart';
import 'package:fromzero_app/views/highlightProjects/highlightProjectsWidget.dart';
import 'package:fromzero_app/views/searchProjectsViews/ProjectMainList.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedView = 0;
  String role = "";
  dynamic currentUser;

  Future<void> setUser()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      role = prefs.getString("role")??"";
    }catch(e){
      Provider.of<AuthProvider>(context,listen: false).logout();
      throw Exception(e);
    }

    var service = ProfilesService();

    if(role=="COMPANY"){
      final response = await service.getCompanyByProfileId();
      setState(() {
        currentUser=response;
      });
    }else{
      final response = await service.getDeveloperByProfileId();
      setState(() {
        currentUser=response;
      });
    }
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
          currentUser!=null?ProfileWidget(profile:currentUser,):Container(),
          const DeveloperListScreen(),
          const HighlightProjects(),
          const CreateProjectApp(),
        ];
      });
    }else {
      setState(() {
        views = [
          currentUser!=null?ProfileDevWidget(profile: currentUser,):Container(),
          const ApplyToProjects(),
          const HighlightProjects(),
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
      drawer: MenuWidget(),
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
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}
