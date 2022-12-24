import 'package:flutter/material.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/home/widgets/brand_items_list.dart';
import 'package:smartbuy/presentation/widgets/carousel.dart';
import 'package:smartbuy/presentation/home/widgets/heading.dart';
import 'package:smartbuy/presentation/home/widgets/popular_brands.dart';
import 'package:smartbuy/presentation/widgets/custom_home_notification_appbar.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZSUyMGRpc2NvdW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YWRpZGFzJTIwc2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/flagged/photo-1556637640-2c80d3201be8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YWRpZGFzJTIwc2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGFkaWRhcyUyMHNob2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];

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
