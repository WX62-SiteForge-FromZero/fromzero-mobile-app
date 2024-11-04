import 'package:flutter/material.dart';

class DeveloperConfirmSendDeliverable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmación de Envío'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '¿Estás seguro de que quieres enviar el entregable?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción para confirmar el envío del entregable
                    Navigator.pop(context); // Regresa a la pantalla anterior después de confirmar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Entregable enviado correctamente')),
                    );
                  },
                  child: Text('Aceptar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cambia el color si es necesario
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra la pantalla de confirmación sin enviar
                  },
                  child: Text('Cancelar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Color para el botón de cancelar
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
