import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/home/widgets/product_structure.dart';
import 'package:smartbuy/pages/product_details/screen_product_details.dart';

class ProductBrandwiseContent extends StatelessWidget {
  final String screenname;
  final String productname;
  final String price;
  final String description;
  final List<dynamic> productimages;
  final List<dynamic> size;
  const ProductBrandwiseContent({
    super.key,
    required this.screenname,
    required this.productname,
    required this.price,
    required this.productimages,
    required this.description,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(() => ScreenProductDetails(
              productname: productname,
              price: price,
              size: size,
              productimages: productimages,
              description: description,
            ));
      },
      child: ProductStructure(
        height: height,
        width: width,
        productImage: productimages[0],
        productname: productname,
        price: price,
        screenname: screenname,
      ),
    );
  }
}
