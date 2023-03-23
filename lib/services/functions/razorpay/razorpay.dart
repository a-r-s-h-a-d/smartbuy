import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:smartbuy/pages/payment/screen_payment_success.dart';
import 'package:smartbuy/services/functions/order/add_to_order.dart';
import 'package:smartbuy/services/models/cart/model_cart.dart';
import 'package:smartbuy/utils/api_key.dart';
import 'package:smartbuy/utils/constants.dart';

Razorpay? razorpay = Razorpay();
Random rand = Random();

Future<void> handlePaymentSuccess(
  PaymentSuccessResponse response, {
  required String address,
  required List<ModelCart> cartList,
  required String customername,
}) async {
  Fluttertoast.showToast(
      msg: "Payment Success:${response.paymentId}", timeInSecForIosWeb: 4);
  Get.to(() => const ScreenPaymentSuccess());
  //place the order
  DateTime now = DateTime.now();
  String formattedDate =
      "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  for (var item in cartList) {
    int randomInt = rand.nextInt(100);
    addOrderDetailsinOrder(
      orderid: formattedDate
              .replaceAll('-', '')
              .replaceAll(':', '')
              .replaceAll(' ', '') +
          randomInt.toString(),
      customername: customername,
      address: address,
      ordertime: formattedDate,
      productname: item.productname,
      productimage: item.productimage,
      size: item.size,
      quantity: item.quantity.toString(),
      price: item.price,
      orderStatus: 1,
      paymentStatus: 'Paid',
      isCancelled: false,
    );
  }
  //delete current cart list

  // Get a reference to the collection
  CollectionReference collectionRef = FirebaseFirestore.instance
      .collection('user')
      .doc(userEmail!)
      .collection('cart');

  // Get all documents in the collection
  QuerySnapshot querySnapshot = await collectionRef.get();

  // Delete each document in the collection
  for (var documentSnapshot in querySnapshot.docs) {
    documentSnapshot.reference.delete();
  }
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
    required BuildContext context,
    required String address,
    required List<ModelCart> cartList,
    required String customername}) {
  var options = {
    'key': razorpayKey,
    'amount': '${amount}00',
    'name': 'smartbuy',
    'prefill': {
      'contact': contact,
      'email': email,
    }
  };
  razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS,
      (PaymentSuccessResponse response) {
    handlePaymentSuccess(
      response,
      address: address,
      cartList: cartList,
      customername: customername,
    );
  });
  razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  try {
    razorpay?.open(options);
  } catch (e) {
    debugPrint(e.toString());
  }
}
