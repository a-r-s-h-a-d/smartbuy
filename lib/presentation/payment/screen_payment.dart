import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

class ScreenPayment extends StatelessWidget {
  const ScreenPayment({super.key});

  final int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: kDarkColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'Payment'),
        ),
      ),
      body: Column(
        children: <Widget>[
          paymentMethod(
            title: "Razorpay",
            value: 0,
            //onChanged: (value) => setState(() => groupValue = value),
            onChanged: (value) {},
          ),
          paymentMethod(
            title: "Cash on Delivery",
            value: 1,
            // onChanged: (value) => setState(() => groupValue = value),
            onChanged: (value) {},
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: height * 0.07,
          width: width * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            child: boldTextStyle(13, kWhiteColor, 'Next ?'),
          ),
        ),
      ),
    );
  }

  Widget paymentMethod({
    required String title,
    required int value,
    required Function(int?) onChanged,
  }) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: boldTextStyle(14, kDarkColor, title),
    );
  }
}
