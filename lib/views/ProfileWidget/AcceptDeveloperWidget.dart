import 'package:flutter/material.dart';
import 'package:fromzero_app/api/profilesService.dart';
import 'package:fromzero_app/api/projectsService.dart';

import '../../models/developer_model.dart';

class AcceptDeveloperWidget extends StatefulWidget {
  final Function() refreshProjects;
  final List<dynamic> candidates;
  final int projectId;
  const AcceptDeveloperWidget({
    super.key,
    required this.candidates,
    required this.projectId,
    required this.refreshProjects
  });

  @override
  State<AcceptDeveloperWidget> createState() => _AcceptDeveloperWidgetState();
}

class _AcceptDeveloperWidgetState extends State<AcceptDeveloperWidget> {
  List<Developer> developers=[];

  Future<void> fetchCandidates()async{
    var service =ProfilesService();

    for(var profileId in widget.candidates){
      final response = await service.getDeveloper(profileId);
      developers.add(response);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCandidates();
  }

  Future<void> acceptDeveloper(BuildContext context,String developerId, bool accepted)async{
    var service = ProjectsService();
    final response = await service.setDeveloperToProject(
        widget.projectId,
        developerId,
        accepted
    );
    if(response.statusCode==200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Lista de candidatos actualizada")
          )
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Error")
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return developers.isNotEmpty?ListView.builder(
        itemCount: developers.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            margin: EdgeInsets.all(8),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                  NetworkImage(
                    developers[index].profileImgUrl
                  ),
              ),
              title: Text(
                  developers[index].firstName+" "+developers[index].lastName
              ),
              subtitle: Column(
                children: [
                  Text(developers[index].description),
                  Text(developers[index].specialties),
                  Expanded(
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                acceptDeveloper(
                                    context,
                                    developers[index].profileId,
                                    true
                                );
                                widget.refreshProjects;
                                Navigator.pop(context);
                              },
                              child: Text("Aceptar"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white
                              ),
                          ),
                          ElevatedButton(
                              onPressed: (){
                                acceptDeveloper(
                                    context,
                                    developers[index].profileId,
                                    false
                                );
                                widget.refreshProjects;
                                Navigator.pop(context);
                              },
                              child: Text("Rechazar"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white
                              ),
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          );
        }
    ):Text(
      "Aún no hay postulantes a este proyecto",
      textAlign: TextAlign.center,
    );
  }
}


/*class AcceptDeveloperWidget extends StatelessWidget {
  List<dynamic> candidates=[];

  AcceptDeveloperWidget({super.key});

  void goBackToProject(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Postulantes al proyecto"),
      ),
      body: ListView.builder(

          itemBuilder: itemBuilder
      )
      */
      /*ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espacio a los lados
            child: ListTile(
              leading: Container(
                width: 100, // Ancho del rectángulo
                height: 80, // Alto del rectángulo
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  'https://i0.wp.com/sangiaophotography.com/wp-content/uploads/2019/01/Fotos-profesionales-para-curriculum-023-20190111-1803.jpg?resize=1024%2C675&ssl=1',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/fallback_image.png', // Cambia esta ruta por una imagen local
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              title: const Text(
                "Juan Domingo Perez",
                style: TextStyle(
                  fontSize: 14, // Tamaño de fuente del título
                  fontWeight: FontWeight.bold, // Poner en negrita
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Soy Desarrollador web con especialidad en lenguajes Java - C# - JavaScript",
                    style: TextStyle(fontSize: 12), // Tamaño de fuente del subtítulo
                  ),
                  const SizedBox(height: 10), // Espacio entre subtítulo y botones
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuir el espacio entre los botones
                    children: [
                      // Botón Aceptar
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue), // Borde azul
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Esquinas curvas
                            ),
                            foregroundColor: Colors.blue, // Texto azul
                            backgroundColor: Colors.white, // Fondo blanco
                            padding: const EdgeInsets.symmetric(vertical: 12), // Aumentar el padding vertical
                          ),
                          onPressed: () {
                            // Acción del botón Aceptar
                            goBackToProject(context);
                          },
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(fontSize: 12), // Tamaño de fuente del botón Aceptar
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Espacio entre los dos botones
                      // Botón Rechazar
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red), // Borde rojo
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Esquinas curvas
                            ),
                            foregroundColor: Colors.red, // Texto rojo
                            backgroundColor: Colors.white, // Fondo blanco
                            padding: const EdgeInsets.symmetric(vertical: 12), // Aumentar el padding vertical
                          ),
                          onPressed: () {
                            // Acción del botón Rechazar
                            goBackToProject(context);
                          },
                          child: const Text(
                            "Rechazar",
                            style: TextStyle(fontSize: 12), // Tamaño de fuente del botón Rechazar
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              tileColor: Colors.grey[300], // Fondo gris claro
            ),
          ),
        ],
      ),*/
/*    );
  }
}*/
