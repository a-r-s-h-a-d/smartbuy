import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/controllers/cart_controller.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/cart/widgets/cart_product_details.dart';
import 'package:smartbuy/presentation/cart/widgets/cart_products.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    CartController cart = Get.put(CartController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: boldTextStyle(15, kDarkColor, 'Your Cart'),
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 5),
        child: ListView(
          children: [
            /* to list cart products */
            CartProduct(height: height, width: width, cart: cart),
            kheight20,
            /* products details & place order  */
            CartProductDetails(height: height),
          ],
        ),
      ),
    );
  }
}
