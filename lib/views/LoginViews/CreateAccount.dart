import 'package:flutter/material.dart';

class CreateAccountWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedProfile;

  CreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedProfile,
                    hint: Text("Profile"),
                    items: [
                      DropdownMenuItem(
                        child: Text("Usuario"),
                        value: "Usuario",
                      ),
                      DropdownMenuItem(
                        child: Text("Desarrollador"),
                        value: "Desarrollador",
                      ),
                    ],
                    onChanged: (value) {
                      selectedProfile = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Seleccione un perfil";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004CFF), // Color de fondo
                      foregroundColor: Colors.white, // Color del texto
                    ),
                    child: Text("Done"),
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("No válido")),
                        );
                      } else {
                        // Acción para crear la cuenta
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Acción para cancelar
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Color(0xFF004CFF)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
