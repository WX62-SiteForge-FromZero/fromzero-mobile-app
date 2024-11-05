import 'package:flutter/material.dart';
import 'package:fromzero_app/views/LoginViews/Inicio.dart';
import 'navbar.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  void toggleLogin(){
    setState(() {
      print("Antes: $isLoggedIn");
      isLoggedIn=!isLoggedIn;
      print("Despues: $isLoggedIn");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoggedIn?Navbar(toggleLogin: toggleLogin,):GetStartedScreen(toggleLogin: toggleLogin,),
    );
  }
}

