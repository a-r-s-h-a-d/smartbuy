import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/login/screen_login.dart';
import 'package:smartbuy/presentation/widgets/app_logo.dart';
import 'package:smartbuy/presentation/widgets/customtextformfield.dart';

class ScreenRegistration extends StatelessWidget {
  const ScreenRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    // final formKey = GlobalKey<FormState>();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                const CustomTextFormField(
                  icon: Icons.person_outline,
                  label: 'Full name',
                  keyboardType: TextInputType.name,
                  // validator: (value) {
                  //   value.isEmpty
                  //       ? 'Enter Your Name'
                  //       : RegExp('!@#<>?":_``~;[]|=-+)(*&^%1234567890')
                  //               .hasMatch(value)
                  //           ? 'Enter a Valid Name'
                  //           : null;
                  // },
                ),
                SizedBox(height: height * 0.020),
                const CustomTextFormField(
                  icon: Icons.email_outlined,
                  label: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  //validator: (value) {},
                ),
                SizedBox(height: height * 0.020),
                const CustomTextFormField(
                  icon: Icons.smartphone,
                  label: 'Mobile number',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: height * 0.020),
                const CustomTextFormField(
                  icon: Icons.lock_outline_rounded,
                  label: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: height * 0.020),
                const CustomTextFormField(
                  icon: Icons.lock_outline,
                  label: 'Re-enter the password',
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: height * 0.03),
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      //if (formKey.currentState!.validate()) {}
                      Get.off(() => const ScreenLogin());
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
                        Get.off(() => const ScreenLogin());
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
