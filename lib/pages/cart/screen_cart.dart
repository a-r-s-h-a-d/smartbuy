import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartbuy/pages/cart/widgets/cart_product_details.dart';
import 'package:smartbuy/services/functions/cart/fetch_from_cart.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/cart/widgets/cart_products.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    int totalamount = 0;

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
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 20, bottom: 20),
        child: ListView(
          children: [
            /* to list cart products */
            CartProduct(
              height: height,
              width: width,
            ),
            kheight20,
            /* products details & place order  */
          ],
        ),
      ),
      bottomSheet: StreamBuilder(
        stream: fetchDatafromCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cartList = snapshot.data;
            if (cartList!.isEmpty) {
              return Center(
                child: Lottie.asset(
                  'assets/animation/empty_cart.json',
                  fit: BoxFit.cover,
                  repeat: true,
                ),
              );
            } else {
              totalamount = 0;
              for (var cart in cartList) {
                final nitemprice = int.parse(cart.price) * cart.quantity;
                totalamount += nitemprice;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CartProductDetails(
                  height: height,
                  totalamount: totalamount,
                  cartList: cartList,
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
