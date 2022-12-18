import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/home/widgets/carousel.dart';
import 'package:smartbuy/presentation/home/widgets/heading.dart';
import 'package:smartbuy/presentation/home/widgets/popular_items.dart';
import 'package:smartbuy/presentation/product_details/screen_product_details.dart';
import 'package:smartbuy/presentation/view_products_and_wishlist/view_products_and_wishlist.dart';
import 'package:smartbuy/presentation/widgets/brandcircle.dart';
import 'package:smartbuy/presentation/widgets/customhomenotificationappbar.dart';

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
          children: [
            Column(
              children: [
                //appbar
                const CustomHomeNotificationAppBar(),
                //carousel
                SizedBox(
                  height: height * 0.3,
                  width: double.infinity,
                  child: Carousel(imgList: imgList),
                ),
                //popular brands
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight10,
                    SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Headings(
                                    title: 'Popular Brands',
                                    navtitle: 'See More'),
                                kheight10,
                                SizedBox(
                                  height: height * .13,
                                  child: ListView.builder(
                                    itemExtent: 90,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      const SizedBox(width: 10);
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(() => ViewProductsandWishlist(
                                                screenname:
                                                    'Brand ${index + 1}',
                                              ));
                                        },
                                        child: BrandCircle(
                                          label: 'Brand ${index + 1}',
                                          image:
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/800px-Adidas_Logo.svg.png',
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Headings(
                                        title: 'Brand Name',
                                        navtitle: 'See More'),
                                    SizedBox(
                                      height: height * 0.35,
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(width: 20),
                                          scrollDirection: Axis.horizontal,
                                          physics: const ScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                    () => ScreenProductDetails(
                                                          productname:
                                                              'Product ${index + 1}',
                                                          price: 'Price',
                                                        ));
                                              },
                                              child: PopularItems(
                                                height: height,
                                                width: width,
                                                productImage:
                                                    'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
                                                productname:
                                                    'Product ${index + 1}',
                                                price: 'Price',
                                                screenname: 'Brand Name',
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
