import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

class Product extends StatelessWidget {
  final String screenname;
  final String productImage;
  final String productname;
  final String price;
  const Product({
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kSilver,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: height * 0.32,
      width: width * 0.4,
      child: Column(
        children: [
          Image.network(
            productImage,
            width: width * 0.35,
            height: height * 0.22,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                regularTextStyle(12, kBlackColor, productname)!,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    regularTextStyle(12, kBlueColor, '₹ $price')!,
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: screenname == 'wishlist'
                            ? InkWell(
                                child: const Icon(Icons.favorite),
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "Alert",
                                    content: const Text(
                                      'Are you sure,\nDo you really want to remove the product',
                                      style: TextStyle(
                                          color: kSilver, fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    confirm: TextButton(
                                        onPressed: () {},
                                        child: regularTextStyle(
                                            12, Colors.green, 'OK')!),
                                    cancel: TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: regularTextStyle(
                                            12, Colors.red, 'Cancel')!),
                                  );
                                },
                              )
                            : const Icon(Icons.favorite_border))
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
