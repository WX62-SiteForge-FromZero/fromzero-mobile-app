import 'package:flutter/material.dart';
import 'package:fromzero_company_app/views/ProfileWidget/YourProjectsWidget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const ProfilePic(),
                  const SizedBox(width: 20),
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
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=>
                                      YourProjectsWidget()
                              )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        ),
                        child: Text("Ver Proyectos",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
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
              const SizedBox(height: 16),
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
