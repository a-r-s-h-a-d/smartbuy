import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/screen_products_and_wishlist/screen_products_and_wishlist.dart';
import 'package:smartbuy/pages/widgets/brandcircle.dart';
import 'package:smartbuy/services/functions/product/list_product.dart';
import 'package:smartbuy/services/models/brand/brand.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/widgets/custom_home_notification_appbar.dart';
import 'package:smartbuy/utils/styles.dart';

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
                child: StreamBuilder(
                  stream: listBrands(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final brands = snapshot.data;

                      return GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.65,
                                crossAxisCount: 4,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 33),
                        children: brands!.map(buildBrands).toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBrands(Brand brand) => InkWell(
        onTap: () => Get.to(
          () => ScreenProductsAndWishlist(
            screenname: brand.brandname,
          ),
        ),
        child: BrandCircle(
          image: brand.brandimage,
          label: brand.brandname,
        ),
      );
}
