import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/home/widgets/product_structure.dart';
import 'package:smartbuy/pages/product_details/screen_product_details.dart';
import 'package:smartbuy/services/models/products/model_product.dart';

class ProductBrandwiseContent extends StatelessWidget {
  final String screenname;
  final Products product;

  const ProductBrandwiseContent({
    super.key,
    required this.screenname,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(() => ScreenProductDetails(
              product: product,
            ));
      },
      child: ProductStructure(
        height: height,
        width: width,
        product: product,
        screenname: screenname,
      ),
    );
  }
}
