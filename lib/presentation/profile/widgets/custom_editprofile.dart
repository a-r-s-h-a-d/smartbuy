import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/profile/screen_profile.dart';
import 'package:smartbuy/presentation/widgets/customtextformfield.dart';

class CustomEditScreen extends StatelessWidget {
  // final Widget route;
  final String fieldname;
  final IconData icon;
  final TextInputType keyboardtype;
  const CustomEditScreen({
    // required this.route,
    required this.fieldname,
    required this.icon,
    required this.keyboardtype,
    super.key,
  });

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

    return Scaffold(
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
        padding: EdgeInsets.symmetric(horizontal: width * 0.08, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                boldTextStyle(14, kDarkColor, fieldname)!,
                SizedBox(height: height * 0.01),
                CustomTextFormField(
                  icon: icon,
                  label: '',
                  keyboardType: keyboardtype,
                ),
              ],
            ),
            Visibility(
                visible: isVisible()!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldTextStyle(14, kDarkColor, 'New Password')!,
                    CustomTextFormField(
                      icon: icon,
                      label: '',
                      keyboardType: keyboardtype,
                    ),
                    SizedBox(height: height * 0.08),
                    boldTextStyle(14, kDarkColor, 'Confirm Password')!,
                    CustomTextFormField(
                      icon: icon,
                      label: '',
                      keyboardType: keyboardtype,
                    ),
                  ],
                )),
            kheight50,
            SizedBox(
              height: height * 0.07,
              width: width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenProfile(),
                  ));
                },
                child: boldTextStyle(13, kWhiteColor, 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
