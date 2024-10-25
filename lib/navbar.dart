import 'package:flutter/material.dart';
import 'package:fromzero_app/views/ProfileWidget/MenuWidget.dart';
import 'package:fromzero_app/views/ProfileWidget/ProfileWidget.dart';
import 'package:fromzero_app/views/createProjectViews/CreateProjectWidget.dart';
import 'package:fromzero_app/views/searchProjectsViews/ProjectMainList.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedView = 0;

  void setView(int view) {
    setState(() {
      selectedView = view;
    });
  }

  Text setViewTitle() {
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
  }

  @override
  Widget build(BuildContext context) {
    final views = [
      const ProfileWidget(),
      const DeveloperListScreen(),
      const Center(child: Text("Destacados")),
      const CreateProjectApp(),
    ];

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
      drawer: const MenuWidget(),
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
        items: const [
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
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}
