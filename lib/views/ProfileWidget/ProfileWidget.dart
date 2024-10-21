import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Perfil de Empresa"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1), // Ajusta el tamaño de la columna
                  1: FlexColumnWidth(2),
                },
                children: [
                  _buildTableRow("País", "Perú"),
                  _buildTableRow("Razón Social", "2024252658"),
                  _buildTableRow("Teléfono", "987654321"),
                  _buildTableRow("Correo", "correo@gmail.com"),
                  _buildTableRow("Sitio web", "geekit.pe"),
                  _buildTableRow("Sector", "Ropa"),
                ],
              ),
              const SizedBox(height: 16), // Espacio antes de la descripción
              Text(
                "Descripción",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                "Geskit es una plataforma donde puedes encontrar ropa y diseños "
                    "que en el mercado actual no puedes encontrar con facilidad.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String key, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value, style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

