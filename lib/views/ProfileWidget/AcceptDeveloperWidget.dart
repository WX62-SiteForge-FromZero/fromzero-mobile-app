import 'package:flutter/material.dart';

class AcceptDeveloperWidget extends StatelessWidget {
  const AcceptDeveloperWidget({super.key});

  void goBackToProject(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aceptar Desarrollador"),
      ),
      body: ListView(
        children: [
          // Primer ListTile con contenido y una imagen rectangular
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
          // Segundo ListTile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(
              leading: Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  'https://i0.wp.com/sangiaophotography.com/wp-content/uploads/2018/03/book-fotografico-Laura-006.jpg?w=1024&ssl=1',
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text(
                "Carla Flores Villanueva",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Especialista en Desarrollador Móvil con perfil en dominio en Kotlin",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12), // Aumentar el padding vertical
                          ),
                          onPressed: () {
                            goBackToProject(context);
                          },
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12), // Aumentar el padding vertical
                          ),
                          onPressed: () {
                            goBackToProject(context);
                          },
                          child: const Text(
                            "Rechazar",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              tileColor: Colors.grey[300],
            ),
          ),
          // Tercer ListTile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(
              leading: Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  'https://i0.wp.com/sangiaophotography.com/wp-content/uploads/2016/11/20160401-4-1752-Foto-de-perfil-para-redes-sociales-y-curriculum-Madrid-.jpg?w=1024&ssl=1',
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text(
                "Carlos Espinoza Beltran",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Soy Desarrollador Móvil con especialidad en lenguajes Kotlin - Swift - Flutter",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12), // Aumentar el padding vertical
                          ),
                          onPressed: () {
                            goBackToProject(context);
                          },
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12), // Aumentar el padding vertical
                          ),
                          onPressed: () {
                            goBackToProject(context);
                          },
                          child: const Text(
                            "Rechazar",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              tileColor: Colors.grey[300],
            ),
          ),
          // Cuarto ListTile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(
              leading: Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  'https://www.shutterstock.com/image-photo/portrait-young-man-ready-job-600nw-2272433909.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text(
                "Pedro Gomez Segovia",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Soy Desarrollador web con especialidad en lenguaje Java - JavaScript",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12), // Aumentar el padding vertical
                          ),
                          onPressed: () {
                            goBackToProject(context);
                          },
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12), // Aumentar el padding vertical
                          ),
                          onPressed: () {
                            goBackToProject(context);
                          },
                          child: const Text(
                            "Rechazar",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              tileColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
