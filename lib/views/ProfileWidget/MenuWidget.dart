import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fromzero_company_app/views/ProfileWidget/EditProfileWidget.dart';
import 'package:fromzero_company_app/views/ProfileWidget/PaymentMethodWidget.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            DrawerHeader(
                child: Text("Menu",style: TextStyle(fontSize: 40),)),
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Payment Methods",
              icon: "assets/icons/credit_card.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Edit Profile",
              icon: "assets/icons/edit.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Chat",
              icon: "assets/icons/chat.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/logout.svg",
              press: () => {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/3237/3237472.png",
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

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
                    builder: (context)=>EditProfileWidget()
                )
            );
          }else if(text=="Chat"){

          }else if(text=="Log Out"){
            Navigator.pop(context);
          }
        },
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.black,
              width: 22,
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
