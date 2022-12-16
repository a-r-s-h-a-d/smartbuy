import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/view_products_and_wishlist/view_products_and_wishlist.dart';
import 'package:smartbuy/presentation/widgets/brandcircle.dart';
import 'package:smartbuy/presentation/widgets/customhomenotificationappbar.dart';

class ScreenExplore extends StatelessWidget {
  const ScreenExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHomeNotificationAppBar(),
            Row(
              children: [
                const SizedBox(width: 20),
                boldTextStyle(16, kBlackColor, 'Top Brands')!,
              ],
            ),
            kheight10,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.65,
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 33),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Get.to(() => ViewProductsandWishlist(
                          screenname: 'Brand ${index + 1}',
                        )),
                    child: BrandCircle(
                      label: 'Brand ${index + 1}',
                      image:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/800px-Adidas_Logo.svg.png',
                    ),
                  ),
                  itemCount: 8,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
