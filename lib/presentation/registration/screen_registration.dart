import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/login/screen_login.dart';
import 'package:smartbuy/presentation/widgets/app_logo.dart';
import 'package:smartbuy/presentation/widgets/custom_text_form_field.dart';

class ScreenRegistration extends StatelessWidget {
  ScreenRegistration({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordcontroller = TextEditingController();
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
                  SizedBox(height: height * 0.05, width: width * 2),
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
                    icon: Icons.person_outline,
                    label: 'Full name',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      }
                      if (!RegExp(
                              r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                          .hasMatch(value)) {
                        return 'Sorry,enter a valid name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.020),
                  CustomTextFormField(
                    icon: Icons.email_outlined,
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
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
                    icon: Icons.smartphone,
                    label: 'Mobile number',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a contact number";
                      }
                      if (value.length != 10) {
                        return 'Mobile number must be of 10 digits';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.020),
                  CustomTextFormField(
                    icon: Icons.lock_outline_rounded,
                    label: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordcontroller,
                    validator: (value) {
                      var passNonNullValue = value ?? "";
                      if (passNonNullValue.isEmpty) {
                        return ("Please enter a password");
                      } else if (passNonNullValue.length < 6) {
                        return ("Password must be more than 5 characters");
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
                      } else if (passwordcontroller.text != value) {
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Get.snackbar(
                            "Account is Created",
                            "Sign in to Continue",
                            icon: const Icon(Icons.person, color: Colors.white),
                            snackPosition: SnackPosition.TOP,
                            borderRadius: 20,
                            margin: const EdgeInsets.all(20),
                            colorText: kDarkColor,
                            duration: const Duration(seconds: 2),
                            isDismissible: true,
                            forwardAnimationCurve: Curves.easeOutBack,
                          );
                          Get.off(() => ScreenLogin());
                        }
                      },
                      child: boldTextStyle(13, kWhiteColor, 'Sign Up'),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      regularTextStyle(12, kSilver, "Have an Account?")!,
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
