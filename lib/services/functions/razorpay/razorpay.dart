import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:smartbuy/pages/payment/screen_payment_success.dart';
import 'package:smartbuy/utils/api_key.dart';

Razorpay? razorpay = Razorpay();

void handlePaymentSuccess(PaymentSuccessResponse response) {
  Fluttertoast.showToast(
      msg: "Payment Success:${response.paymentId}", timeInSecForIosWeb: 4);
  Get.to(() => const ScreenPaymentSuccess());
}

void handlePaymentError(PaymentFailureResponse response) {
  Fluttertoast.showToast(
      msg: "Payment Failed :${response.code}-${response.message}",
      timeInSecForIosWeb: 4);
}

void makePayment(
    {required String amount,
    required String contact,
    required String email,
    required BuildContext context}) {
  var options = {
    'key': razorpayKey,
    'amount': '${amount}00',
    'name': 'smartbuy',
    'prefill': {
      'contact': contact,
      'email': email,
    }
  };
  razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
  razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  try {
    razorpay?.open(options);
  } catch (e) {
    debugPrint(e.toString());
  }
}
