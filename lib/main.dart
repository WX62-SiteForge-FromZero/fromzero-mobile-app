import 'package:flutter/material.dart';
import 'package:fromzero_app/views/LoginViews/CreateAccount.dart';
import 'package:fromzero_app/views/LoginViews/Inicio.dart';
import 'package:fromzero_app/views/LoginViews/Login.dart';
import 'navbar.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navbar(),
      //home: Inicio(),
      //home: CreateAccountWidget(),
      //home: LoginWidget(),
    );
  }
}