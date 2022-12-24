import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/account/screen_account.dart';
import 'package:smartbuy/presentation/widgets/custom_text_form_field.dart';

class CustomEditScreen extends StatelessWidget {
  final String fieldname;
  final IconData icon;
  final TextInputType keyboardtype;
  final String fieldvalues;
  CustomEditScreen({
    required this.fieldname,
    required this.icon,
    required this.keyboardtype,
    required this.fieldvalues,
    super.key,
  });
  final TextEditingController passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool? isVisible() {
      if (fieldname == 'Old Password') {
        return true;
      }
      return false;
    }

    return Form(
      key: formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: boldTextStyle(15, kDarkColor, 'Edit Profile'),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldTextStyle(14, kDarkColor, fieldname)!,
                  SizedBox(height: height * 0.01),
                  CustomTextFormField(
                    icon: icon,
                    label: '',
                    controller: TextEditingController(text: fieldvalues),
                    keyboardType: keyboardtype,
                    validator: (value) {
                      if (fieldname == 'Phone Number') {
                        if (value == null || value.isEmpty) {
                          return "Please enter a Contact number";
                        }
                        if (value.length != 10) {
                          return 'Mobile Number must be of 10 digit';
                        }
                        return null;
                      } else if (fieldname == 'Full Name') {
                        if (value == null || value.isEmpty) {
                          return "Please enter Full Name";
                        }
                        if (!RegExp(
                                r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                            .hasMatch(value)) {
                          return 'Please enter valid Name';
                        }
                        return null;
                      } else if (fieldname == 'Date of Birth') {
                        if (value == null || value.isEmpty) {
                          return "Please enter the Date";
                        }
                      } else if (fieldname == 'e-mail') {
                        if (value.isEmpty || value == null) {
                          return "Please enter an email";
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Invalid email';
                        }
                        return null;
                      } else {
                        if (value.isEmpty) {
                          return ("Password is required");
                        } else if (value.length < 6) {
                          return ("requires more than 5 characters");
                        }
                        return null;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Visibility(
                  visible: isVisible()!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.05),
                      boldTextStyle(14, kDarkColor, 'New Password')!,
                      CustomTextFormField(
                        icon: icon,
                        label: '',
                        controller: passwordcontroller,
                        keyboardType: keyboardtype,
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return "Please enter new password";
                          } else if (value.length < 6) {
                            return ("required more than 5 characters");
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.05),
                      boldTextStyle(14, kDarkColor, 'Confirm Password')!,
                      CustomTextFormField(
                        icon: icon,
                        label: '',
                        keyboardType: keyboardtype,
                        validator: (value) {
                          if (passwordcontroller.text != value) {
                            return "Password doesn't matched";
                          } else if (value.isEmpty || value == null) {
                            return "re-enter the password";
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: height * 0.07,
            width: width * 0.9,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.defaultDialog(
                    radius: 10.0,
                    contentPadding: const EdgeInsets.all(20.0),
                    title: 'Remove',
                    middleText: '$fieldname changed',
                    textConfirm: 'Okay',
                    confirm: OutlinedButton.icon(
                      onPressed: () => Get.offAll(() => const ScreenAccount()),
                      icon: const Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                      label: const Text(
                        'Okay',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  );
                }
              },
              child: boldTextStyle(13, kWhiteColor, 'Save'),
            ),
          ),
        ),
      ),
    );
  }
}
