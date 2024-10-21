import 'package:flutter/material.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  bool _isEditing = false; // Controla el estado de edición
  String _country = "Perú"; // Valor inicial del país

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50, // Establece la altura del AppBar
        backgroundColor: Colors.blue, // Cambia el color de la AppBar si lo deseas
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
                  _buildTableRow("País", _isEditing ? _buildCountryField() : Text(_country)),
                  _buildTableRow("Razón Social", Text("2024252658")),
                  _buildTableRow("Teléfono", Text("987654321")),
                  _buildTableRow("Correo", Text("correo@gmail.com")),
                  _buildTableRow("Sitio web", Text("geekit.pe")),
                  _buildTableRow("Sector", Text("Ropa")),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = true; // Activar el modo de edición
                      });
                    },
                    child: Text('Editar Cambios'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = false; // Guardar cambios y desactivar el modo de edición
                      });
                      // Aquí puedes agregar lógica para guardar los cambios permanentemente
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cambios guardados: $_country')),
                      );
                    },
                    child: Text('Guardar Cambios'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountryField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Ingrese el país',
      ),
      onChanged: (value) {
        setState(() {
          _country = value; // Actualiza el valor del país
        });
      },
    );
  }

  TableRow _buildTableRow(String key, Widget value) {
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
          child: value,
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
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage:
            NetworkImage("https://cdn-icons-png.flaticon.com/512/3237/3237472.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Icon(Icons.camera_alt, color: Colors.black), // Ícono de cámara
              ),
            ),
          ),
        ],
      ),
    );
  }
}
