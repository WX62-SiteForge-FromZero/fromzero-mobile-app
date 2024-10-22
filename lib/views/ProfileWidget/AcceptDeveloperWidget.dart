import 'package:flutter/material.dart';

class AcceptDeveloperWidget extends StatelessWidget {
  const AcceptDeveloperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tus proyectos"),
      ),
      body: ListView(
        children: [
          // Primer ListTile con contenido y una imagen rectangular
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espacio a los lados
            child: ListTile(
              leading: Container(
                width: 80, // Ancho del rectángulo
                height: 60, // Alto del rectángulo
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Si hay un error, carga una imagen local o un placeholder
                    return Image.asset(
                      'assets/images/fallback_image.png', // Cambia esta ruta por una imagen local
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              title: const Text("Proyecto de juego de Ajedrez"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Este proyecto se debe realizar en java"),
                  const SizedBox(height: 10), // Espacio entre subtítulo y botones
                  Row(
                    children: [
                      // Botón Aceptar
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue), // Borde azul
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Esquinas curvas
                          ),
                          foregroundColor: Colors.blue, // Texto azul
                          backgroundColor: Colors.white, // Fondo blanco
                        ),
                        onPressed: () {
                          // Acción del botón Aceptar
                        },
                        child: const Text("Aceptar"),
                      ),
                      const SizedBox(width: 10), // Espacio entre los dos botones
                      // Botón Rechazar
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red), // Borde rojo
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Esquinas curvas
                          ),
                          foregroundColor: Colors.red, // Texto rojo
                          backgroundColor: Colors.white, // Fondo blanco
                        ),
                        onPressed: () {
                          // Acción del botón Rechazar
                        },
                        child: const Text("Rechazar"),
                      ),
                    ],
                  ),
                ],
              ),
              tileColor: Colors.grey[300], // Fondo gris claro
            ),
          ),
        ],
      ),
    );
  }
}
