import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/services/controller/createprofile_controller.dart';
import 'package:smartbuy/utils/colors.dart';

class CustomTextFormField2 extends StatelessWidget {
  final TextEditingController? dobController;
  CustomTextFormField2({
    super.key,
    this.dobController,
  });
  final profilecontroller = Get.put(CreateProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProfileController>(
        builder: (controller) => TextFormField(
              controller: profilecontroller.controller,
              readOnly: true,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                filled: true,
                fillColor: ktextfieldColor,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    size: 25,
                    color: kBlueColor,
                  ),
                  onPressed: () {
                    profilecontroller.selectDate(context);
                  },
                ),
                isDense: true,
                labelText: 'DOB',
                labelStyle: const TextStyle(color: kSilver, fontSize: 10),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ));
  }
}
