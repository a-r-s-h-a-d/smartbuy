import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartbuy/main.dart';

Future resetPassword(
  BuildContext context,
  TextEditingController emailController,
) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: emailController.text.trim(),
    );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Reset Email Sent')));
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  } on FirebaseAuthException catch (e) {
    // print(e);
    final snackbar = SnackBar(content: Text(e.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
