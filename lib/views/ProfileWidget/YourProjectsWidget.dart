import 'package:flutter/material.dart';

class YourProjectsWidget extends StatelessWidget {
  const YourProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tus proyectos"),
      ),
      body: ListView(
        children: [
          // Primer ListTile con contenido
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espacio a los lados
            child: ListTile(
              title: Text(
                "Proyecto de juego de Ajedrez",
                textAlign: TextAlign.center,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Este proyecto se debe realizar en java"),
                  const SizedBox(height: 10), // Espacio entre subtítulo y botón
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Color del botón
                      foregroundColor: Colors.white, // Color del texto del botón
                    ),
                    onPressed: () {
                      // Acción del botón
                    },
                    child: Text("Ver candidatos"),
                  ),
                ],
              ),
              tileColor: Colors.grey[300], // Fondo gris claro
            ),
          ),

          const SizedBox(height: 10), // Espacio en blanco entre ListTiles

          // Segundo ListTile con contenido
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(
              title: Text(
                "Proyecto de Aplicación Móvil de compras",
                textAlign: TextAlign.center,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Este proyecto se debe realizar en Flutter"),
                  const SizedBox(height: 10), // Espacio entre subtítulo y botón
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Color del botón
                      foregroundColor: Colors.white, // Color del texto del botón
                    ),
                    onPressed: () {
                      // Acción del botón
                    },
                    child: Text("Ver candidatos"),
                  ),
                ],
              ),
              tileColor: Colors.grey[300], // Fondo gris claro
            ),
          ),

          const SizedBox(height: 10), // Espacio en blanco entre ListTiles

          // Tercer ListTile vacío
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(
              title: Text(""),
              subtitle: Text(""),
              tileColor: Colors.grey[300],
            ),
          ),

          const SizedBox(height: 10), // Espacio en blanco entre ListTiles

          // Cuarto ListTile vacío
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(
              title: Text(""),
              subtitle: Text(""),
              tileColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
