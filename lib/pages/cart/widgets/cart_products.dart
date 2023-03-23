import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartbuy/pages/cart/widgets/build_cart.dart';
import 'package:smartbuy/services/functions/cart/fetch_from_cart.dart';
import 'package:smartbuy/services/models/cart/model_cart.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class CartProduct extends StatelessWidget {
  final double height;
  final double width;
  const CartProduct({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fetchDatafromCart(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Center(
            child: regularTextStyle(15, kDarkColor, 'Something went wrong', 1),
          );
        } else if (snapshot.hasData) {
          final cartList = snapshot.data!;

          if (cartList.isEmpty) {
            return Center(
              child: Lottie.asset(
                'assets/animation/empty_cart.json',
                fit: BoxFit.cover,
              ),
            );
          } else {
            return Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      final cart = cartList[index];
                      return BuildCart(
                        cart: ModelCart(
                          productname: cart.productname,
                          productimage: cart.productimage,
                          price: cart.price,
                          size: cart.size,
                          quantity: cart.quantity,
                        ),
                        index: index,
                        cartList: cartList,
                      );
                    }),
                kheight20,
              ],
            );
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
