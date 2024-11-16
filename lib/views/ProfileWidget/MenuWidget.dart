import 'package:flutter/material.dart';
import 'package:fromzero_app/prefs/authProvider.dart';
import 'package:provider/provider.dart';
import '../messages/ChatListView.dart';
import '../paymentViews/DeveloperPaymentStatusView.dart';
import '../paymentViews/CompanyPendingPaymentsView.dart';

class MenuWidget extends StatelessWidget {
  final String currentUser;
  final String role;

  const MenuWidget({
    super.key,
    required this.currentUser,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            DrawerHeader(
              child: Text("Menu", style: TextStyle(fontSize: 40)),
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              role: role,
              text: "Payment Methods",
              icon: Icons.credit_card,
              onTap: () {
                if (role == "DEVELOPER") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeveloperPaymentStatusView(developerId: currentUser),
                    ),
                  );
                } else if (role == "COMPANY") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyPendingPaymentsView(companyId: currentUser),
                    ),
                  );
                }
              },
            ),
            ProfileMenu(
              role: role,
              text: "Edit Profile",
              icon: Icons.edit,
            ),
            ProfileMenu(
              role: role,
              text: "Chat",
              icon: Icons.chat,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatListView(profileId: currentUser, role: role),
                  ),
                );
              },
            ),
            ProfileMenu(
              role: role,
              text: "Log Out",
              icon: Icons.logout,
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              },
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
  final VoidCallback? onTap;

  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    //}) : super(key: key);
    //required this.role
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
        onPressed: onTap,

        /*onPressed: (){
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
        },*/

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