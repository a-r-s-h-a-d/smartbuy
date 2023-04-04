import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/tabs/main_page/screen_mainpage.dart';
import 'package:smartbuy/pages/tabs/main_page/widgets/bottom_nav.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenPaymentSuccess extends StatelessWidget {
  const ScreenPaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF066E87),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: height * 0.08,
              backgroundColor: kWhiteColor,
              child: Icon(
                Icons.check,
                color: const Color(0xFF066E87),
                size: height * 0.1,
              ),
            ),
          ),
          kheight10,
          regularTextStyle(15, kWhiteColor, 'Your payment is complete.', 1)!,
          regularTextStyle(
              15, kWhiteColor, 'Please check the delivery status at', 1)!,
          regularTextStyle(15, kWhiteColor, 'Order Tracking page.', 1)!,
          kheight20,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Get.offAll(ScreenMainPage());
                indexChangeNotifier.value = 3;
              },
              child: Container(
                height: height * 0.05,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: kBradius10,
                ),
                child: Center(
                    child: boldTextStyle(
                        14, const Color(0xFF066E87), 'Track Orders')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
