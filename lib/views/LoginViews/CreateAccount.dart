import 'package:flutter/material.dart';

void main() {
  runApp(CreateAccountWidget());
}

class CreateAccountWidget extends StatefulWidget {
  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedProfile;
  bool _obscurePassword = true; // Variable para controlar la visibilidad de la contraseña

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    "Create\nAccount", // Dividir el texto en dos líneas
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left, // Alinear a la izquierda
                  ),
                  SizedBox(height: 40),
                  _buildInputContainer(
                    child: TextFormField(
                      controller: emailController,
                      decoration: _inputDecoration("Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Este campo es obligatorio";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  // Mostrar campos de First Name y Last Name solo si "Desarrollador" es seleccionado
                  if (selectedProfile == "Desarrollador") ...[
                    _buildInputContainer(
                      child: TextFormField(
                        controller: firstNameController,
                        decoration: _inputDecoration("First Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Este campo es obligatorio";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildInputContainer(
                      child: TextFormField(
                        controller: lastNameController,
                        decoration: _inputDecoration("Last Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Este campo es obligatorio";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                  ]else if(selectedProfile == "Empresa")...[
                    _buildInputContainer(
                      child: TextFormField(
                        controller: companyNameController,
                        decoration: _inputDecoration("Company Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Este campo es obligatorio";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                  _buildInputContainer(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword, // Usar la variable para el texto oculto
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.grey[800]), // Color gris oscuro para la letra
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey[600],
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword; // Alternar la visibilidad
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Este campo es obligatorio";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildInputContainer(
                    child: Container( // Añadir un Container para quitar el subrayado
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Fondo gris suave
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedProfile,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10.0), // Ajusta el valor según lo necesites
                          child: Text("Profile"),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none, // Sin borde
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text("Empresa"),
                            value: "Empresa",
                          ),
                          DropdownMenuItem(
                            child: Text("Desarrollador"),
                            value: "Desarrollador",
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedProfile = value; // Cambiar el estado seleccionado
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return "Seleccione un perfil";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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

                        //api
                      }
                    },
                  ),
                  SizedBox(height: 1),
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
      ),
    );
  }

  Widget _buildInputContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Fondo gris suave
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Cambia la posición de la sombra
          ),
        ],
      ),
      child: child,
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[800]), // Color gris oscuro para la letra
      filled: true, // Para llenar el fondo
      fillColor: Colors.grey[200], // Color de fondo del campo
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.transparent), // Sin borde visible
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.transparent), // Sin borde visible
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.transparent), // Sin borde visible
      ),
    );
  }
}
