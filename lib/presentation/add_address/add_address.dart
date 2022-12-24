import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/address/screen_address.dart';
import 'package:smartbuy/presentation/widgets/custom_text_form_field.dart';

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
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'First Name')!,
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'Last Name')!,
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'Street Address')!,
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'Street Address 2 (Optional)')!,
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            boldTextStyle(14, kDarkColor, 'City')!,
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'State/Provinance/Region')!,
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'ZipCode')!,
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            kheight20,
            boldTextStyle(14, kDarkColor, 'Phone Number')!,
            CustomTextFormField(
              label: '',
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            kheight20,
            SizedBox(
              height: height * 0.07,
              width: width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const ScreenAddress(
                        screenname: 'Address',
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
