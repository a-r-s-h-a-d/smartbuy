import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/services/functions/address/add_to_address.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/widgets/custom_text_form_field.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenAddAddress extends StatelessWidget {
  ScreenAddAddress({
    super.key,
  });
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController housenobuildingnameController =
      TextEditingController();
  final TextEditingController roadnameAreaColonyController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final Position position;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.12),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'Add Address'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            children: [
              kheight20,
              CustomTextFormField(
                label: 'Full Name (Required)*',
                keyboardType: TextInputType.name,
                controller: fullnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide the necessary details';
                  }
                  return null;
                },
              ),
              kheight20,
              CustomTextFormField(
                label: 'Phone Number (Required)*',
                keyboardType: TextInputType.phone,
                controller: phoneNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide the necessary details';
                  }
                  return null;
                },
              ),
              kheight20,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextFormField(
                      label: 'Pincode (Required)*',
                      keyboardType: TextInputType.number,
                      controller: pinCodeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide the necessary details';
                        }
                        return null;
                      },
                    ),
                  ),
                  kheight20,
                  kwidth20,
                  Container(
                    height: height * 0.065,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kBlueColor,
                    ),
                    width: width * 0.3,
                    child: TextButton.icon(
                        icon: const Icon(
                          Icons.gps_fixed,
                          color: kWhiteColor,
                        ),
                        onPressed: () async {
                          // Position position = await getGeoLocationPosition();
                          // log(position.toString());
                        },
                        label: regularTextStyle(
                            12, kWhiteColor, 'current location', 3)!),
                  ),
                ],
              ),
              kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.45,
                    child: CustomTextFormField(
                      label: 'State (Required)*',
                      keyboardType: TextInputType.name,
                      controller: stateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide the necessary details';
                        }
                        return null;
                      },
                    ),
                  ),
                  kheight20,
                  SizedBox(
                    width: width * 0.45,
                    child: CustomTextFormField(
                      label: 'City (Required)*',
                      keyboardType: TextInputType.name,
                      controller: cityController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide the necessary details';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              kheight20,
              CustomTextFormField(
                label: 'House No.,Building Name (Required)*',
                keyboardType: TextInputType.name,
                controller: housenobuildingnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide the necessary details';
                  }
                  return null;
                },
              ),
              kheight20,
              CustomTextFormField(
                label: 'Road Name,Area,Colony (Required)*',
                keyboardType: TextInputType.name,
                controller: roadnameAreaColonyController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide the necessary details';
                  }
                  return null;
                },
              ),
              kheight20,
              kheight20,
              SizedBox(
                height: height * 0.07,
                width: width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      addtoAddress(
                          fullname: fullnameController.text.trim(),
                          phoneNumber: phoneNumberController.text.trim(),
                          pincode: pinCodeController.text.trim(),
                          state: stateController.text.trim(),
                          city: cityController.text.trim(),
                          housenoorbuildingname:
                              housenobuildingnameController.text.trim(),
                          roadareacolony:
                              roadnameAreaColonyController.text.trim());
                      Get.back();
                    }
                    return;
                  },
                  child: boldTextStyle(13, kWhiteColor, 'Save Address'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
