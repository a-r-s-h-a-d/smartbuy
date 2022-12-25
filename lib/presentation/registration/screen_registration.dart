import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/authentication/sign_up/sign_up.dart';
import 'package:smartbuy/presentation/login/screen_login.dart';
import 'package:smartbuy/presentation/widgets/app_logo.dart';
import 'package:smartbuy/presentation/widgets/custom_text_form_field.dart';

class ScreenRegistration extends StatelessWidget {
  ScreenRegistration({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.15, width: width * 2),
                  const AppLogo(
                    labelColor: kWhiteColor,
                    label: 'smartbuy',
                    size: 11,
                    boxColor: kBlueColor,
                  ),
                  SizedBox(height: height * 0.045),
                  Text("Let's Get Started", style: kheading1),
                  SizedBox(height: height * 0.005),
                  const Text('Create a new Account',
                      style: TextStyle(color: kSilver, fontSize: 12)),
                  SizedBox(height: height * 0.05),
                  CustomTextFormField(
                    icon: Icons.email_outlined,
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return "Choose an email address";
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Sorry, enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.020),
                  CustomTextFormField(
                    icon: Icons.lock_outline_rounded,
                    label: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: (value) {
                      var passNonNullValue = value ?? "";
                      if (passNonNullValue.isEmpty) {
                        return ("Password is required");
                      } else if (passNonNullValue.length < 6) {
                        return ("Password Must be more than 5 characters");
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.020),
                  CustomTextFormField(
                    icon: Icons.lock_outline,
                    label: 'Re-enter the password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please re-enter the password';
                      } else if (passwordController.text != value) {
                        return "Password doesn't matched";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.9,
                    child: ElevatedButton(
                      onPressed: () => signUp(context, emailController,
                          passwordController, formKey),
                      child: boldTextStyle(13, kWhiteColor, 'Sign Up'),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      regularTextStyle(
                          12, kSilver, "Already have an Account?")!,
                      GestureDetector(
                        child: boldTextStyle(14, kBlueColor, '\tSign In')!,
                        onTap: () {
                          Get.off(() => ScreenLogin());
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
