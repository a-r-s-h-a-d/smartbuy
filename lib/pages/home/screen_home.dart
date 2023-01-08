import 'package:flutter/material.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/home/widgets/brand_items_list.dart';
import 'package:smartbuy/pages/widgets/carousel.dart';
import 'package:smartbuy/pages/home/widgets/heading.dart';
import 'package:smartbuy/pages/home/widgets/popular_brands.dart';
import 'package:smartbuy/pages/widgets/custom_home_notification_appbar.dart';
import 'package:smartbuy/utils/images.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                /* custom app bar used in home & explore */

                const CustomHomeNotificationAppBar(),

                /* carousel */

                SizedBox(
                  height: height * 0.3,
                  width: double.infinity,
                  child: Carousel(imgList: imgList),
                ),
                kheight10,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.18,
                        child: Column(
                          children: [
                            const Headings(
                                title: 'Popular Brands', navtitle: 'Explore'),
                            kheight10,

                            /* list popular brands in circle */

                            PopularBrands(height: height),
                          ],
                        ),
                      ),

                      /* list some items from popular brands */
                      const Headings(title: 'All Products', navtitle: ''),
                      BrandItemsList(height: height, width: width),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
