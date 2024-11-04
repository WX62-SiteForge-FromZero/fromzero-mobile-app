import 'package:flutter/material.dart';

class DeveloperDeliverableDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entregable 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Documento de especificación de Requisitos del software SRS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '15 Septiembre 2024, 8:20 PM',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Estado actual: Pendiente',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              'Descripción',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Este entregable consistirá en un documento detallado que describe los requisitos funcionales y no funcionales de la Plataforma de Comercio Electrónico Geekit. Incluirá casos de uso, diagramas de flujo, requisitos de usuario, requisitos de sistema y cualquier otra información relevante para guiar el desarrollo del software.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Archivos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.file_download),
                  onPressed: () {
                    // Acción para descargar el archivo
                  },
                ),
                IconButton(
                  icon: Icon(Icons.file_download),
                  onPressed: () {
                    // Acción para descargar el archivo
                  },
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/developerConfirmSendDeliverable');
                },
                child: Text('Enviar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
