import 'package:flutter/material.dart';

class CreateProjectToolbar extends StatelessWidget implements PreferredSizeWidget {
  const CreateProjectToolbar({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Crear proyecto", style: TextStyle(fontSize: 40.0)),
      backgroundColor: Colors.lightBlue,
      bottom: PreferredSize(
        preferredSize: Size.infinite,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0,bottom: 8.0),
            child: Text(
              "Detalles del proyecto",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);


}
