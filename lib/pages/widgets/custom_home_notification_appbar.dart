import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/pages/search/screen_search.dart';
import 'package:smartbuy/services/functions/product/list_product.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/screen_products_and_wishlist/screen_products_and_wishlist.dart';

class CustomHomeNotificationAppBar extends StatelessWidget {
  const CustomHomeNotificationAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        kheight30,
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: CupertinoSearchTextField(
                  placeholder: 'Search Product',
                  placeholderStyle: const TextStyle(
                    color: kSilver,
                    fontSize: 12,
                  ),
                  itemColor: kBlueColor,
                  itemSize: 18,
                  onTap: () {
                    final productsStream = listProducts();
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(
                        productsStream: productsStream,
                        height: height,
                        width: width,
                      ),
                    );
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() =>
                      const ScreenProductsAndWishlist(screenname: 'wishlist'));
                },
                icon: const Icon(Icons.favorite),
              ),
              // IconButton(
              //   onPressed: () {
              //     Get.to(() => const ScreenNotification());
              //   },
              //   icon: const Icon(Icons.notifications),
              // ),
            ],
          ),
        ),
        kheight20,
      ],
    );
  }
}
