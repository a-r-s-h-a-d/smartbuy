import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/services/controller/product_controller.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class Product extends StatelessWidget {
  final String screenname;
  final String productImage;
  final String productname;
  final String price;
  Product({
    required this.screenname,
    required this.productImage,
    required this.productname,
    required this.price,
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  // final ProductController controller = ProductController();
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: kBradius10,
      ),
      height: height * 0.269,
      width: width * 0.45,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.network(
              fit: BoxFit.fill,
              productImage,
              width: width * 0.42,
              height: height * 0.15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                regularTextStyle(12, kBlackColor, productname, 1)!,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    regularTextStyle(12, kBlueColor, '₹ $price', 1)!,
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          log('pressed');
                          controller.isFav();
                        },
                        icon: GetBuilder<ProductController>(
                          builder: (controller) => Icon(controller.icon),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
