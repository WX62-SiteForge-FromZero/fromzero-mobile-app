import 'package:flutter/material.dart';

class YourProjectsWidget extends StatelessWidget {
  const YourProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Text("Tus Proyectos",
                style: TextStyle(fontSize: 36,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Primer contenedor
                  Container(
                    height: 150,
                    width: 300,
                    color: Colors.teal,
                    child: Center(
                      child: Text("Plataforma",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )

                ],
              )
            ],
          )),
    );
  }
}