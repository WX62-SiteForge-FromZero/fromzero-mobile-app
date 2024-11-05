import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  final VoidCallback toggleLogin;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginWidget({super.key, required this.toggleLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100), // Espacio superior
                  Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Espacio entre el título y la frase
                  Row(
                    children: [
                      Text(
                        "Good to see you back!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 4), // Ajuste de espacio entre la frase y el corazón
                      Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 40), // Espacio entre la frase y las cajas de texto
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
                  SizedBox(height: 20), // Espacio entre las cajas de texto
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
                  SizedBox(height: 40), // Espacio entre el campo de contraseña y el botón
                  Center( // Centra el botón en la pantalla
                    child: ElevatedButton(
                      child: Text("Next", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF004CFF), // Color de fondo del botón
                        padding: EdgeInsets.symmetric(vertical: 15), // Ajuste del padding
                        minimumSize: Size(double.infinity, 50), // Ancho del botón
                      ),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("No válido")),
                          );
                        } else {
                          // Acción para proceder al siguiente paso
                          Navigator.pop(context);
                          toggleLogin();
                        }
                      },
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
