import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/widgets/custom_text_form_field.dart';
import 'package:smartbuy/pages/widgets/custom_textform_field_2.dart';
import 'package:smartbuy/services/controller/createprofile_controller.dart';
import 'package:smartbuy/services/functions/profile/add_profile.dart';
import 'package:smartbuy/services/functions/validations/validation.dart';
import 'package:smartbuy/services/models/profile/model_profile.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/images.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenAddProfile extends StatelessWidget {
  ScreenAddProfile({
    super.key,
  });

  static final formKey = GlobalKey<FormState>();
  final profileController = Get.put(CreateProfileController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.18),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: kDarkColor),
              onPressed: () => Get.back(),
            ),
            title: boldTextStyle(15, kDarkColor, 'Create Profile'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      GetBuilder<CreateProfileController>(
                        builder: (_) => CircleAvatar(
                          radius: height * 0.08,
                          backgroundColor: kBlueColor.withOpacity(0.7),
                          child: CircleAvatar(
                            backgroundColor: kWhiteColor,
                            radius: height * 0.073,
                            backgroundImage: profileController.pickedFile ==
                                    null
                                ? const AssetImage(tempprofile) as ImageProvider
                                : FileImage(
                                    File(profileController.pickedFile!)),
                          ),
                        ),
                      ),
                      FractionalTranslation(
                        translation: const Offset(3.1, 2.6),
                        child: InkWell(
                          onTap: () async {
                            await profileController.selectFile();
                          },
                          child: CircleAvatar(
                            radius: height * 0.02,
                            backgroundColor: kBlueColor.withOpacity(0.3),
                            child: const Icon(
                              Icons.camera,
                              size: 25.0,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.04),
                CustomTextFormField(
                  controller: nameController,
                  label: 'Name',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (!validateName(value)) {
                      return 'invalid name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                boldTextStyle(12, kgreen, 'use the Icon *')!,
                SizedBox(height: height * 0.02),
                CustomTextFormField2(),
                SizedBox(height: height * 0.04),
                CustomTextFormField(
                  controller: phoneController,
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.length != 10) {
                      return 'number must be 10 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.04),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          String photoUrl =
                              await profileController.uploadFile();
                          addProfile(
                            name: nameController.text,
                            dob: profileController.controller.text,
                            profileUrl: photoUrl,
                            phone: phoneController.text,
                          );
                          Get.back();
                          Get.snackbar('Success', 'Profile Created',
                              backgroundColor: kgreen.withOpacity(0.9),
                              colorText: kWhiteColor,
                              margin: const EdgeInsets.all(10));
                        } catch (e) {
                          if (e.toString() ==
                              'Null check operator used on a null value') {
                            String alert = 'image is required';
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(alert)));
                          }
                        }
                      }
                    },
                    icon: const Icon(Icons.rocket_launch_outlined),
                    label: boldTextStyle(12, kWhiteColor, 'Upload')!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
