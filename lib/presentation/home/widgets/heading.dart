import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/main_page/widgets/bottom_nav.dart';
import 'package:smartbuy/presentation/screen_products_and_wishlist/screen_products_and_wishlist.dart';

class Headings extends StatelessWidget {
  final String title;
  final String navtitle;
  const Headings({
    required this.title,
    required this.navtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        boldTextStyle(14, kDarkColor, title)!,
        InkWell(
          onTap: () {
            navtitle == 'Explore'
                ? indexChangeNotifier.value = 1
                : Get.to(() => ScreenProductsAndWishlist(screenname: title));
          },
          child: boldTextStyle(12, kBlueColor, navtitle)!,
        )
      ],
    );
  }
}
