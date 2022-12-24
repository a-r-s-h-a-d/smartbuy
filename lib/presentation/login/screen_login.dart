import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/main_page/screen_mainpage.dart';
import 'package:smartbuy/presentation/registration/screen_registration.dart';
import 'package:smartbuy/presentation/widgets/app_logo.dart';
import 'package:smartbuy/presentation/widgets/custom_text_form_field.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final formKey = GlobalKey<FormState>();

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
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return "email is required";
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.020),
                CustomTextFormField(
                  icon: Icons.lock_outline,
                  label: 'Password',
                  keyboardType: TextInputType.visiblePassword,
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
                SizedBox(height: height * 0.03),
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (formKey.currentState!.validate()) {
                      //   Get.offAll(() => ScreenMainPage());
                      // }
                      Get.offAll(() => ScreenMainPage());
                    },
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
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 65,
                  ),
                  text: "Login With Google",
                ),
                SizedBox(height: height * 0.02),
                SignInButton(
                  Buttons.FacebookNew,
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 65,
                  ),
                  text: "Login With fb",
                ),
                SizedBox(height: height * 0.02),
                regularTextStyle(12, kSilver, "Forgot Password?")!,
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    regularTextStyle(12, kSilver, "Don't have an Account?")!,
                    GestureDetector(
                      child: boldTextStyle(14, kBlueColor, '\tRegister')!,
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
