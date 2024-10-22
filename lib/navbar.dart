import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {

    final views=[
      // profile
      // search
      // highlight
      // publish
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("TOOLBAR"),
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
