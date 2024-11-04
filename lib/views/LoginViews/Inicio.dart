import 'package:flutter/material.dart';

void main() {
  runApp(Inicio());
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetStartedScreen(),
    );
  }
}

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen PNG centrada
            Image.asset(
              'assets/icon.png', // Ruta de la imagen en assets
              width: 100,        // Ancho de la imagen
              height: 100,       // Alto de la imagen
            ),
            const SizedBox(height: 20),
            // Texto de bienvenida en dos líneas
            const Text(
              'Magnificent user interface for\ncreating software development',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'NunitoSans', // Fuente personalizada
              ),
            ),
            const SizedBox(height: 60), // Incrementar el espacio aquí
            // Botón de "Let's get started"
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF004CFF), // Color del botón
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  // Aquí puedes agregar la funcionalidad del botón
                },
                child: const Text(
                  "Let's get started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Texto de "I already have an account" y botón circular con flecha
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'I already have an account',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NunitoSans',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(width: 10),
                // Botón circular con icono de flecha a la derecha
                CircleAvatar(
                  backgroundColor: Color(0xFF004CFF),
                  radius: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Acción al presionar el botón de flecha
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}