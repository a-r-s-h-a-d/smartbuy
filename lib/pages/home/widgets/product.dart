import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/services/controller/wishlist_controller.dart';
import 'package:smartbuy/services/models/products/model_product.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class Product extends StatelessWidget {
  final String screenname;
  final Products product;
  final double height;
  final double width;
  Product({
    required this.screenname,
    Key? key,
    required this.height,
    required this.width,
    required this.product,
  }) : super(key: key);

  final controller = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.readWishlist(),
      builder: (context, snapshot) {
        final wishlist = snapshot.data;
        return Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: kBradius10,
          ),
          height: height * 0.269,
          width: width * 0.45,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: width * 0.42,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kWhiteColor,
                  ),
                  child: Image.network(
                    product.productimages[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    regularTextStyle(12, kBlackColor, product.productname, 1)!,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        currency(14, kBlueColor, int.parse(product.price))!,
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            if (wishlist?.any((element) =>
                                    element.productname ==
                                    product.productname) ??
                                false) {
                              controller.removefromWishlist(product);
                            } else {
                              controller.addtoWishlist(product);
                            }
                          },
                          icon: wishlist?.any((element) =>
                                      element.productname ==
                                      product.productname) ==
                                  true
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
