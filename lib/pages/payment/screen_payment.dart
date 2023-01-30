import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:smartbuy/pages/payment/screen_payment_success.dart';
import 'package:smartbuy/services/functions/razorpay/razorpay.dart';
import 'package:smartbuy/services/controller/payment_controller.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenPayment extends StatelessWidget {
  ScreenPayment({
    super.key,
    required this.payableamount,
    required this.contact,
  });
  final int? groupValue = 0;
  final int payableamount;
  final String contact;
  Razorpay? razorpay;
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
          title: boldTextStyle(15, kDarkColor, 'Payments'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: boldTextStyle(16, kDarkColor, 'Payment Methods')!,
          ),
          kheight20,
          paymentMethod(
            imageIcon: 'assets/images/razorpay-icon.png',
            height: height,
            title: "Razorpay",
            value: 0,
            onChanged: (value) {
              controller.changeGroupValue(value!);
            },
          ),
          kheight10,
          paymentMethod(
            imageIcon: 'assets/images/hand-money-dollar-coin-icon.png',
            height: height,
            title: "Cash on Delivery",
            value: 1,
            onChanged: (value) {
              controller.changeGroupValue(value!);
            },
          ),
        ],
      ),
      bottomSheet: SizedBox(
        height: height * 0.06,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (controller.groupValue == 0) {
              makePayment(
                  amount: payableamount.toString(),
                  contact: contact,
                  email: userEmail!,
                  context: context);
            } else {
              Get.to(() => const ScreenPaymentSuccess());
            }
          },
          child: boldTextStyle(13, kWhiteColor, 'Pay'),
        ),
      ),
    );
  }

  Widget paymentMethod({
    required String title,
    required int value,
    required double height,
    required String imageIcon,
    required Function(int?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.1,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFE7ECEF),
          borderRadius: kBradius10,
        ),
        child: Center(
            child: GetBuilder<PaymentController>(
          builder: (_) => RadioListTile(
            activeColor: kBlackColor,
            controlAffinity: ListTileControlAffinity.trailing,
            value: value,
            groupValue: controller.groupValue,
            onChanged: onChanged,
            title: ListTile(
              leading: Container(
                height: height * 0.06,
                width: height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: kBradius10,
                  color: kWhiteColor,
                  image: DecorationImage(
                      image: AssetImage(imageIcon), fit: BoxFit.contain),
                ),
              ),
              title: boldTextStyle(12, kDarkColor, title),
            ),
          ),
        )),
      ),
    );
  }
}
