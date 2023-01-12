import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartbuy/services/functions/cart/add_to_cart.dart';
import 'package:smartbuy/utils/styles.dart';

class BottomSheetButton extends StatelessWidget {
  final String label;
  final Color buttoncolor;
  final Color labelcolor;
  final String? productname;
  final String? productimage;
  final String? price;
  final String? size;

  const BottomSheetButton({
    required this.label,
    required this.buttoncolor,
    required this.labelcolor,
    Key? key,
    required this.height,
    required this.width,
    this.productname,
    this.productimage,
    this.price,
    this.size,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.07,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttoncolor),
        ),
        onPressed: () async {
          if (label == 'Add to Cart') {
            try {
              await addtoCart(
                productName: productname!,
                productImage: productimage!,
                price: price!,
                productSize: size!,
              );
              Fluttertoast.showToast(
                msg: "Succesfully added to the cart",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                fontSize: 18.0,
              );
            } catch (e) {
              log(e.toString());
            }
          }
        },
        child: boldTextStyle(13, labelcolor, label),
      ),
    );
  }
}
