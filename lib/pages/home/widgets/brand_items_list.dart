import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/home/widgets/product_structure.dart';
import 'package:smartbuy/pages/product_details/screen_product_details.dart';
import 'package:smartbuy/services/functions/product/list_product.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class BrandItemsList extends StatelessWidget {
  const BrandItemsList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: regularTextStyle(15, kDarkColor, 'Something went wrong', 1),
          );
        } else if (snapshot.hasData) {
          final products = snapshot.data;
          if (products!.isEmpty) {
            return Center(
              child: regularTextStyle(15, kDarkColor, 'Add Some Products', 1),
            );
          } else {
            return GridView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.69,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0),
              children: products
                  .map(
                    (products) => InkWell(
                      onTap: () {
                        Get.to(() => ScreenProductDetails(
                              product: products,
                            ));
                      },
                      child: ProductStructure(
                          screenname: products.productname,
                          product: products,
                          height: height,
                          width: width),
                    ),
                  )
                  .toList(),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
