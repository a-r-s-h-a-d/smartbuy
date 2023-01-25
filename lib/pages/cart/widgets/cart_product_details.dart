import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/checkout/screen_checkout.dart';
import 'package:smartbuy/services/models/cart/model_cart.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class CartProductDetails extends StatelessWidget {
  final double height;
  final int totalamount;
  final List<ModelCart>? cartList;
  const CartProductDetails({
    Key? key,
    required this.height,
    required this.totalamount,
    required this.cartList,
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
              height: height * .05,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => ScreenCheckout(
                        totalamount: totalamount,
                        cartList: cartList,
                      ));
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
