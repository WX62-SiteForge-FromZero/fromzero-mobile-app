import 'package:flutter/material.dart';
import 'package:fromzero_company_app/SecondWidget.dart';
import 'package:fromzero_company_app/models/models.dart';

void main() {
  runApp(MaterialApp(
    home: CreateProjectApp(),
  ));
}

class CreateProjectApp extends StatelessWidget {
  final CreateProjectData projectData = CreateProjectData();
  final TextEditingController nameController=TextEditingController();
  final TextEditingController descController=TextEditingController();
  CreateProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Crear proyecto", style: TextStyle(fontSize: 25.0)),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detalles del proyecto",
                      style: TextStyle(fontSize: 10.0),
                    ),
                    /*IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))*/
                  ],
                )),
          ),
          body: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: "Nombre de proyecto"
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: descController,
                    decoration: InputDecoration(
                        labelText: "Descripcion del proyecto"
                    ),
                    keyboardType: TextInputType.text,
                  )
                ],
              )
          ),
          floatingActionButton: MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Siguiente"),
              onPressed: (){
                projectData.name=nameController.text;
                projectData.description=descController.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>
                            ProjectTypeWidget(projectData: projectData)
                    )
                );
              }
          ),
    );
  }
}
