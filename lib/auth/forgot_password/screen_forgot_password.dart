import 'package:flutter/material.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/services/functions/reset_password/forgot_password.dart';
import 'package:smartbuy/pages/widgets/custom_text_form_field.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenForgotPassword extends StatelessWidget {
  ScreenForgotPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: boldTextStyle(15, kDarkColor, 'Forgot Password'),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: Center(
        child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    icon: Icons.email_outlined,
                    label: 'E mail Address',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      return;
                    },
                  ),
                  kheight30,
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.9,
                    child: ElevatedButton(
                      onPressed: () => resetPassword(context, emailController),
                      child: boldTextStyle(13, kWhiteColor, 'Reset Password'),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
