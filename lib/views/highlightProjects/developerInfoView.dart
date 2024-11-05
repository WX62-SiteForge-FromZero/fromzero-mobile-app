import 'package:flutter/material.dart';

class DeveloperInfoView extends StatelessWidget {
  final int developerId;

  const DeveloperInfoView({Key? key, required this.developerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulación de datos del desarrollador en base al developerId
    final developerName = _getDeveloperName(developerId);
    final developerDescription = _getDeveloperDescription(developerId);
    final developerImage = _getDeveloperImage(developerId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del desarrollador
            Center(
              child: Image.network(
                developerImage,
                height: 150, // Puedes ajustar la altura según necesites
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Nombre del desarrollador
            Text(
              developerName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Descripción del desarrollador
            Text(
              developerDescription,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(), // Esto empuja el botón hacia abajo
            // Botón Regresar
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresa a la lista de proyectos
              },
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }

  // Método simulado para obtener el nombre del desarrollador
  String _getDeveloperName(int id) {
    switch (id) {
      case 1:
        return 'Developer A';
      case 2:
        return 'Developer B';
      case 3:
        return 'Developer C';
      default:
        return 'Unknown Developer';
    }
  }

  // Método simulado para obtener la descripción de la compañía
  String _getDeveloperDescription(int id) {
    switch (id) {
      case 1:
        return 'Description for Company A.';
      case 2:
        return 'Description for Company B.';
      case 3:
        return 'Description for Company C.';
      default:
        return 'No description available.';
    }
  }

  // Método simulado para obtener la imagen de la compañía
  String _getDeveloperImage(int id) {
    switch (id) {
      case 1:
        return 'https://example.com/imageA.jpg'; // Reemplaza con la URL de la imagen real
      case 2:
        return 'https://example.com/imageB.jpg';
      case 3:
        return 'https://example.com/imageC.jpg';
      default:
        return 'https://example.com/default.jpg'; // Imagen por defecto
    }
  }
}