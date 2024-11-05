import 'package:flutter/material.dart';
import 'package:fromzero_app/views/LoginViews/Inicio.dart';
import 'package:fromzero_app/prefs/user_prefs.dart';
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

  Future<void> cleatPrefs()async{
    await clearData();
  }

  void toggleLogin(){
    setState(() {
      if(isLoggedIn==true){
        cleatPrefs();
      }
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

