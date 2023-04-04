import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/widgets/productbrandwisecontent.dart';
import 'package:smartbuy/services/controller/wishlist_controller.dart';
import 'package:smartbuy/services/functions/product/list_product.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenProductsAndWishlist extends StatelessWidget {
  final String screenname;
  const ScreenProductsAndWishlist({
    required this.screenname,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishlistController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: boldTextStyle(15, kDarkColor, screenname),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
          stream: screenname == 'wishlist'
              ? controller.readWishlist()
              : readProductsbyBrandwise(screenname: screenname),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child:
                    regularTextStyle(15, kDarkColor, 'Something went wrong', 1),
              );
            } else if (snapshot.hasData) {
              final product = snapshot.data;
              if (product!.isEmpty) {
                return Center(
                  child:
                      regularTextStyle(15, kDarkColor, 'Add Some Products', 1),
                );
              } else {
                return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.69,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0),
                  children: product
                      .map((product) => ProductBrandwiseContent(
                          screenname: screenname, product: product))
                      .toList(),
                );
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
