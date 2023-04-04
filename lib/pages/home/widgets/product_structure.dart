import 'package:flutter/material.dart';
import 'package:smartbuy/services/models/products/model_product.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/home/widgets/product.dart';

class ProductStructure extends StatelessWidget {
  final String screenname;
  final Products product;

  const ProductStructure({
    Key? key,
    required this.screenname,
    required this.product,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight10,
          Product(
            height: height,
            width: width,
            screenname: screenname,
            product: product,
          ),
        ],
      ),
    );
  }
}
