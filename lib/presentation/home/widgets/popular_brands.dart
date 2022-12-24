import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/presentation/screen_products_and_wishlist/screen_products_and_wishlist.dart';
import 'package:smartbuy/presentation/widgets/brandcircle.dart';

class PopularBrands extends StatelessWidget {
  const PopularBrands({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height * .13,
        child: ListView.builder(
          itemExtent: 90,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            const SizedBox(width: 10);
            return GestureDetector(
              onTap: () {
                Get.to(() => ScreenProductsAndWishlist(
                      screenname: 'Brand ${index + 1}',
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
    );
  }
}
