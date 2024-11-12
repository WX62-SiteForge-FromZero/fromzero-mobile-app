import 'package:flutter/material.dart';
import 'package:fromzero_app/prefs/authProvider.dart';
import 'package:fromzero_app/views/ProfileWidget/EditProfileWidget.dart';
import 'package:fromzero_app/views/ProfileWidget/PaymentMethodWidget.dart';
import 'package:fromzero_app/views/messages/Message.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget {
  final String role;
  const MenuWidget({
    super.key,
    required this.role
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            DrawerHeader(
                child: Text("Menu",style: TextStyle(fontSize: 40),)),
            const SizedBox(height: 20),
            ProfileMenu(
              role: role,
              text: "Payment Methods",
              icon: Icons.credit_card
            ),
            ProfileMenu(
              role: role,
              text: "Edit Profile",
              icon: Icons.edit
            ),
            ProfileMenu(
              role: role,
              text: "Chat",
              icon: Icons.chat
            ),
            ProfileMenu(
              role: role,
              text: "Log Out",
              icon: Icons.logout
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String role;
  final String text;
  final IconData icon;

  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.role
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: (){
          if(text=="Payment Methods"){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>PaymentMethodWidget()
                )
            );
          }else if(text=="Edit Profile"){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>EditProfileWidget(role: role,)
                )
            );
          }else if(text=="Chat"){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>Message(
                        companyName: "companyName")
                )
            );
          }else if(text=="Log Out"){
            Provider.of<AuthProvider>(context,listen: false).logout();
          }
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),
            ),
          ],
        ),
      ),
    );
  }
}
