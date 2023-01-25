// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/address/screen_address.dart';
import 'package:smartbuy/pages/payment/screen_payment.dart';
import 'package:smartbuy/services/models/address/model_address.dart';
import 'package:smartbuy/services/models/cart/model_cart.dart';
import 'package:smartbuy/services/provider/address_controller.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenCheckout extends StatelessWidget {
  final int totalamount;
  final List<ModelCart>? cartList;
  ScreenCheckout({super.key, required this.totalamount, this.cartList});

  AddressController controller = Get.put(AddressController());
  ModelAddress? result;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    FirebaseFirestore.instance
        .collection('user')
        .doc(userEmail)
        .collection('address')
        .get();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          iconTheme: const IconThemeData(color: kWhiteColor),
          backgroundColor: const Color.fromARGB(255, 2, 33, 59),
          elevation: 0,
          title: boldTextStyle(15, kWhiteColor, 'Checkout'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: height * 0.215,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 2, 33, 59),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      boldTextStyle(16, kWhiteColor, 'Deliver to')!,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: kWhiteColor,
                        ),
                        height: height * 0.05,
                        width: width * 0.2,
                        child: TextButton(
                            onPressed: () async {
                              result = await Get.to(() => ScreenAddress());
                            },
                            child:
                                regularTextStyle(12, kDarkColor, 'Change', 1)!),
                      ),
                    ],
                  ),
                  kheight20,
                  GetBuilder<AddressController>(
                    builder: (_) => Container(
                      child: controller.fullname == null
                          ? Column(
                              children: [
                                kheight20,
                                Center(
                                  child: regularTextStyle(
                                      12,
                                      kWhiteColor,
                                      'Add an address to continue the shopping',
                                      2)!,
                                ),
                              ],
                            )
                          : SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  regularTextStyle(15, kWhiteColor,
                                      controller.fullname.toString(), 1)!,
                                  regularTextStyle(
                                      13,
                                      kWhiteColor,
                                      '${controller.housenoorbuildingname.toString()} , ${controller.roadareacolony.toString()} , ${controller.city.toString()} , ${controller.state.toString()} - ${controller.pincode.toString()}',
                                      2)!,
                                  regularTextStyle(15, kWhiteColor,
                                      controller.phoneNumber.toString(), 1)!,
                                  kheight20,
                                ],
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //cart items

          SizedBox(height: height * 0.07),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: kBradius10,
                    color: const Color.fromARGB(255, 2, 33, 59),
                  ),
                  height: height * 0.05,
                  width: width * 0.25,
                  child: Center(
                      child: boldTextStyle(14, kWhiteColor, 'Products')!),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: kBradius10,
                    color: const Color.fromARGB(255, 2, 33, 59),
                  ),
                  height: height * 0.05,
                  width: height * 0.05,
                  child: Center(
                      child: boldTextStyle(
                          12, kWhiteColor, '${cartList!.length}')),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              height: height * 0.14,
              width: width * 0.8,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: height * 0.2,
                  width: width * 0.05,
                ),
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: cartList!.length,
                itemBuilder: (context, index) => Container(
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 2, 33, 59),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: kBradius10,
                                color: kWhiteColor,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        cartList![index].productimage),
                                    fit: BoxFit.contain),
                              ),
                              width: width * 0.3,
                              height: height * 0.12,
                            ),
                          ),
                          SizedBox(width: width * 0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.43,
                                child: Text(
                                  cartList![index].productname,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kWhiteColor,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              currency(12, kWhiteColor,
                                  int.parse(cartList![index].price))!,
                              regularTextStyle(12, kWhiteColor,
                                  'Qty : ${cartList![index].quantity}', 1)!,
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.06),
          //price details
          priceDetails(height),
        ],
      ),
    );
  }

  //Price Details
  Padding priceDetails(double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        height: height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 2),
          ],
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boldTextStyle(16, kDarkColor, 'Price Details')!,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 2, 33, 59),
                    ),
                    child: const Text('Buy'),
                    onPressed: () {
                      Get.to(() => const ScreenPayment());
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: ksilverOriginal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 7.5,
              ),
              child: priceRowList(
                  label: 'Price',
                  amount: totalamount.toString(),
                  rowname: 'price'),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 7.5,
                ),
                child: priceRowList(label: 'Delivery Charge', amount: 'FREE')),
            const Divider(
              thickness: 1,
              color: ksilverOriginal,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15,
                ),
                child: priceRowList(
                    label: 'Total Amount',
                    amount: totalamount.toString(),
                    rowname: 'totalamount')),
          ],
        ),
      ),
    );
  }

  priceRowList(
      {required String label,
      required String amount,
      String? rowname,
      int? number}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        boldTextStyle(14, kDarkColor, label)!,
        rowname == 'price' || rowname == 'totalamount'
            ? currency(12, kDarkColor, int.parse(amount))!
            : boldTextStyle(12, kDarkColor, amount)!,
      ],
    );
  }
}
