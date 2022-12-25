import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartbuy/presentation/login/screen_login.dart';
import 'package:smartbuy/presentation/main_page/screen_mainpage.dart';

class ScreenIntermediate extends StatelessWidget {
  const ScreenIntermediate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ScreenMainPage();
        } else {
          return ScreenLogin();
        }
      },
    );
  }
}
