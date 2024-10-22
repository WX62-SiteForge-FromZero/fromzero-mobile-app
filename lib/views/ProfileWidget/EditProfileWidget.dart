import 'package:flutter/material.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  bool _isEditing = false; // Controla el estado de edición
  String _country = "Perú";
  String _razonSocial = "2024252658";
  String _telefono = "987654321";
  String _correo = "correo@gmail.com";
  String _sitioWeb = "geekit.pe";
  String _sector = "Ropa";
  String _descripcion =
      "Geskit es una plataforma donde puedes encontrar ropa y diseños que en el mercado actual no puedes encontrar con facilidad.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30, // Establece la altura del AppBar
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
                          backgroundColor: const Color(0xFF004CFF), // Color del botón
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        ),
                        child: Text(
                          "Proyecto",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, // Texto en negrita (bold)
                          ),
                        ),
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
                  _buildTableRow("País", _isEditing ? _buildTextField(_country, (value) => _country = value) : Text(_country)),
                  _buildTableRow("Razón Social", _isEditing ? _buildTextField(_razonSocial, (value) => _razonSocial = value) : Text(_razonSocial)),
                  _buildTableRow("Teléfono", _isEditing ? _buildTextField(_telefono, (value) => _telefono = value) : Text(_telefono)),
                  _buildTableRow("Correo", _isEditing ? _buildTextField(_correo, (value) => _correo = value) : Text(_correo)),
                  _buildTableRow("Sitio web", _isEditing ? _buildTextField(_sitioWeb, (value) => _sitioWeb = value) : Text(_sitioWeb)),
                  _buildTableRow("Sector", _isEditing ? _buildTextField(_sector, (value) => _sector = value) : Text(_sector)),
                ],
              ),
              const SizedBox(height: 16), // Espacio antes de la descripción
              Text(
                "Descripción",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              _isEditing
                  ? _buildTextField(_descripcion, (value) => _descripcion = value, maxLines: 3)
                  : Text(
                _descripcion,
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004CFF), // Color del botón
                    ),
                    child: Text(
                      'Editar Cambios',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold, // Texto en negrita (bold)
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = false; // Guardar cambios y desactivar el modo de edición
                      });
                      // Aquí puedes agregar lógica para guardar los cambios permanentemente
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cambios guardados')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004CFF), // Color del botón
                    ),
                    child: Text(
                      'Guardar Cambios',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold, // Texto en negrita (bold)
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para crear campos de texto editables
  Widget _buildTextField(String initialValue, Function(String) onChanged, {int maxLines = 1}) {
    return TextField(
      controller: TextEditingController(text: initialValue),
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(8.0),
      ),
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
