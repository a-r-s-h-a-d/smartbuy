import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/services/functions/sign_in.dart';
import 'package:smartbuy/auth/forgot_password/screen_forgot_password.dart';
import 'package:smartbuy/auth/login/widgets/signup_button.dart';
import 'package:smartbuy/auth/registration/screen_registration.dart';
import 'package:smartbuy/pages/widgets/app_logo.dart';
import 'package:smartbuy/pages/widgets/custom_text_form_field.dart';
import 'package:smartbuy/services/functions/auth_service.dart';
import 'package:smartbuy/utils/images.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.10, width: width * 2),
                const AppLogo(
                  labelColor: kWhiteColor,
                  label: 'smartbuy',
                  size: 11,
                  boxColor: kBlueColor,
                ),
                SizedBox(height: height * 0.045),
                Text('Welcome to smartbuy', style: kheading1),
                SizedBox(height: height * 0.01),
                const Text('Sign in to continue',
                    style: TextStyle(color: kSilver, fontSize: 12)),
                SizedBox(height: height * 0.045),
                CustomTextFormField(
                  icon: Icons.email_outlined,
                  label: 'Email ID',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(height: height * 0.020),
                CustomTextFormField(
                  icon: Icons.lock_outline,
                  label: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(height: height * 0.03),
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.9,
                  child: ElevatedButton(
                    onPressed: () =>
                        signIn(context, emailController, passwordController),
                    child: boldTextStyle(13, kWhiteColor, 'Sign In'),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    boldTextStyle(15, kSilver, 'OR')!,
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                SignUpButton(
                  buttonName: 'Continue with Google',
                  imagePath: google,
                  size: 12,
                ),
                SizedBox(height: height * 0.02),
                // SignUpButton(
                //   buttonName: 'Continue with Phone ',
                //   imagePath: phone,
                //   size: 12,
                // ),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: () => Get.to(() => ScreenForgotPassword()),
                  child: regularTextStyle(12, kSilver, "Forgot Password?", 1)!,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    regularTextStyle(12, kSilver, "Don't have an Account?", 1)!,
                    GestureDetector(
                      child: boldTextStyle(14, kBlueColor, '\tSign Up')!,
                      onTap: () {
                        Get.to(() => ScreenRegistration());
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
