import 'package:flutter/material.dart';

class EditProfileWidget extends StatefulWidget {
  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final _formKey = GlobalKey<FormState>();
  String _country = "Perú"; // Valor inicial del país

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _country,
                decoration: InputDecoration(labelText: 'País'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un país';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _country = value; // Actualiza el valor del país
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí puedes manejar la lógica para guardar el perfil
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Perfil actualizado: $_country')),
                    );
                  }
                },
                child: Text('Guardar Cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
