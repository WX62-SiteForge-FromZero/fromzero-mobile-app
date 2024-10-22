import 'package:flutter/material.dart';
import 'package:fromzero_company_app/views/createProjectViews/CreateProjectWidget.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedView=0;

  void setView(int view){
    setState(() {
      selectedView=view;
    });
  }

  Text setViewTitle(){
    if(selectedView==0){
      return Text("Crear Proyecto",style: TextStyle(fontSize: 35),);
    }else{
      return Text("Toolbar");
    }
  }

  @override
  Widget build(BuildContext context) {

    final views=[
      // profile
      // search
      // highlight
      // publish
      const CreateProjectApp()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: setViewTitle(),
      ),
      body: IndexedStack(
        index: selectedView,
        children: views,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedView,
          onTap: (index){
            setState(() {
              selectedView=index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Perfil"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Buscar"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Destacados"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.drive_file_rename_outline),
                label: "Publicar"
            )
          ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}
