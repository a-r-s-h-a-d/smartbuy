import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/home/widgets/product_structure.dart';
import 'package:smartbuy/pages/product_details/screen_product_details.dart';
import 'package:smartbuy/services/functions/product/list_product.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

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
    return StreamBuilder(
      stream: listProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: regularTextStyle(15, kDarkColor, 'Something went wrong', 1),
          );
        } else if (snapshot.hasData) {
          final products = snapshot.data;
          if (products!.isEmpty) {
            return Center(
              child: regularTextStyle(15, kDarkColor, 'Add Some Products', 1),
            );
          } else {
            return GridView(
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.57,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 0),
              children: products
                  .map(
                    (products) => InkWell(
                      onTap: () {
                        Get.to(() => ScreenProductDetails(
                              productname: products.productname,
                              price: products.price,
                              size: products.size,
                              productimages: products.productimages,
                              description: products.description,
                            ));
                      },
                      child: ProductStructure(
                          screenname: products.productname,
                          price: products.price,
                          productImage: products.productimages[0],
                          productname: products.productname,
                          height: height,
                          width: width),
                    ),
                  )
                  .toList(),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}










































// ListView.separated(
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         physics: const ScrollPhysics(),
//         itemCount: 15,
//         separatorBuilder: (context, index) => kheight20,
//         itemBuilder: (context, index) => Column(
//           children: [
//             Headings(title: 'Brand ${index + 1}', navtitle: 'See More'),
//             SizedBox(
//               height: height * 0.35,
//               child: ListView.separated(
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(width: 20),
//                   scrollDirection: Axis.horizontal,
//                   physics: const ScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Get.to(() => ScreenProductDetails(
//                               productname: 'Product ${index + 1}',
//                               price: 'Price',
//                               size: const [],
//                               description: '',
//                               productimages: const [],
//                             ));
//                       },
//                       child: ProductStructure(
//                         height: height,
//                         width: width,
//                         productImage:
//                             'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
//                         productname: 'Product ${index + 1}',
//                         price: 'Price',
//                         screenname: 'Brand Name',
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),