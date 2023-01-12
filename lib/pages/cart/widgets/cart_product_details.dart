import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/pages/address/screen_address.dart';
import 'package:smartbuy/utils/styles.dart';

class CartProductDetails extends StatelessWidget {
  final double height;
  final int totalamount;
  const CartProductDetails({
    Key? key,
    required this.height,
    required this.totalamount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .062,
      decoration: BoxDecoration(
        border: Border.all(color: kSilver),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currency(14, kDarkColor, totalamount)!,
            SizedBox(
              height: height * .06,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const ScreenAddress(screenname: 'Ship To'));
                },
                child: boldTextStyle(14, kWhiteColor, 'Place Order'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
