import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/home/widgets/heading.dart';
import 'package:smartbuy/presentation/home/widgets/product_structure.dart';
import 'package:smartbuy/presentation/product_details/screen_product_details.dart';

class BrandItemsList extends StatelessWidget {
  const BrandItemsList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        itemCount: 15,
        separatorBuilder: (context, index) => kheight20,
        itemBuilder: (context, index) => Column(
          children: [
            Headings(title: 'Brand ${index + 1}', navtitle: 'See More'),
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
                        screenname: 'Brand Name',
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
