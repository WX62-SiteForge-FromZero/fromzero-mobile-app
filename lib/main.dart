import 'package:flutter/material.dart';
/*
import 'package:fromzero_company_app/views/ProfileWidget/AcceptDeveloperWidget.dart';
import 'package:fromzero_company_app/views/ProfileWidget/EditProfileWidget.dart';
import 'package:fromzero_company_app/views/ProfileWidget/MenuWidget.dart';
import 'package:fromzero_company_app/views/ProfileWidget/PaymentMethodWidget.dart';
import 'package:fromzero_company_app/views/ProfileWidget/ProfileWidget.dart';
import 'package:fromzero_company_app/views/ProfileWidget/YourProjectsWidget.dart';
*/
import 'package:fromzero_company_app/navbar.dart';


// void main() {
//   runApp(MaterialApp(
//     //home: ProfileWidget(),
//     //home: MenuWidget(),
//     //home: YourProjectsWidget(),
//     //home: EditProfileWidget(),
//     //home: AcceptDeveloperWidget(),
//     home: PaymentMethodWidget(),
//   ) );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navbar(),
    );
  }
}