import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/widgets/customtextformfield.dart';

class ScreenAddAddress extends StatelessWidget {
  const ScreenAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'Add Address'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            boldTextStyle(14, kDarkColor, 'Country/Region')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'First Name')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'Last Name')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'Street Address')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'Street Address 2 (Optional)')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            boldTextStyle(14, kDarkColor, 'City')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'State/Provinance/Region')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'ZipCode')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'Phone Number')!,
            const CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
            ),
            kheight20,
            SizedBox(
              height: height * 0.07,
              width: width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const ScreenAddAddress());
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
