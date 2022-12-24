import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/home/widgets/product_structure.dart';
import 'package:smartbuy/presentation/product_details/screen_product_details.dart';

class ScreenProductsAndWishlist extends StatelessWidget {
  final String screenname;

  const ScreenProductsAndWishlist({
    required this.screenname,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, screenname),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.57,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.to(() => ScreenProductDetails(
                    productname: 'Product ${index + 1}',
                    price: 'Price',
                  ));
            },
            child: ProductStructure(
              height: height,
              width: width,
              productImage:
                  'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
              productname: 'Product ${index + 1}',
              price: 'Price',
              screenname: screenname,
            ),
          ),
        ),
      ),
    );
  }
}
