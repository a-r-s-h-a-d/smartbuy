import 'package:flutter/material.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/home/widgets/product.dart';

class PopularItems extends StatelessWidget {
  final String screenname;
  final String productname;
  final String price;
  final String productImage;
  const PopularItems({
    Key? key,
    required this.screenname,
    required this.productImage,
    required this.productname,
    required this.price,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight10,
          Product(
            height: height,
            width: width,
            screenname: screenname,
            productImage: productImage,
            productname: productname,
            price: price,
          ),
        ],
      ),
    );
  }
}
