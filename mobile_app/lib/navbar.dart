import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/login.dart';
import 'package:post_app/account.dart';
import 'Feedback.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.purple,
      child: ListView(
        children: [
          const SizedBox(height: 20),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Account())));
            },
            leading: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: Text(
              'Account',
              style: GoogleFonts.urbanist(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 530),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const FeedbackHome())));
            },
            leading: const Icon(
              Icons.feedback,
              color: Colors.white,
            ),
            title: Text(
              'Feedback',
              style: GoogleFonts.urbanist(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LoginScreen())));
            },
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text(
              'Log out',
              style: GoogleFonts.urbanist(
                  fontSize: 21, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
