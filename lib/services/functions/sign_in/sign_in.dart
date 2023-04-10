import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartbuy/pages/tabs/main_page/screen_mainpage.dart';

signIn(BuildContext context, TextEditingController emailController,
    TextEditingController passwordController) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  } on FirebaseAuthException catch (e) {
    final snackbar = SnackBar(content: Text(e.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => ScreenMainPage()),
    (route) => false,
  );

  // Get.offAll(() => ScreenMainPage);
}
