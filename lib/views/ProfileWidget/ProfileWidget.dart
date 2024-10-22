import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 28, // Establece la altura del AppBar
        backgroundColor: Colors.white, // Cambia el color de la AppBar si lo deseas
        leading: IconButton(
          icon: const Icon(Icons.menu), // Ícono de menú
          onPressed: () {
            // Acción al presionar el ícono de menú
          },
        ),
        // Título eliminado
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fila con el icono de perfil y el nombre
              Row(
                children: [
                  const ProfilePic(),
                  const SizedBox(width: 20), // Espacio entre la imagen y el texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Empresa",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10), // Espacio entre el nombre y el botón
                      ElevatedButton(
                        onPressed: () {
                          // Acción del botón
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Color del botón
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        ),
                        child: Text("Proyecto"),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espacio antes de la tabla
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

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: const CircleAvatar(
        backgroundImage:
        NetworkImage("https://cdn-icons-png.flaticon.com/512/3237/3237472.png"),
      ),
    );
  }
}
