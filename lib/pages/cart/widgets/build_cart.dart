import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/cart/widgets/texticonbutton.dart';
import 'package:smartbuy/services/controller/wishlist_controller.dart';
import 'package:smartbuy/services/models/cart/model_cart.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class BuildCart extends StatelessWidget {
  final ModelCart cart;
  final List<ModelCart> cartList;
  final int index;
  const BuildCart({
    super.key,
    required this.cart,
    required this.index,
    required this.cartList,
  });

  @override
  Widget build(BuildContext context) {
    WishlistController controller = Get.put(WishlistController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        kheight20,
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: ksilverOriginal,
            ),
            borderRadius: kBradius10,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        color: kWhiteColor,
                      ),
                      height: height * 0.065,
                      width: width * 0.25,
                      child: ClipRect(
                        child: CachedNetworkImage(
                          imageUrl: cart.productimage,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    kwidth20,
                    SizedBox(
                        width: width * 0.54,
                        child: ListTile(
                            title: Text(
                              cart.productname,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Poppins bold',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kDarkColor,
                              ),
                            ),
                            subtitle: regularTextStyle(
                                12, kSilver, 'size : ${cart.size}', 1)))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: kSilver,
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (cart.quantity > 1) {
                            final docCartProduct = FirebaseFirestore.instance
                                .collection('user')
                                .doc(FirebaseAuth.instance.currentUser!.email)
                                .collection('cart')
                                .doc(cart.productname + cart.size);

                            docCartProduct
                                .update({"quantity": cart.quantity - 1});
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    boldTextStyle(16, kDarkColor, cart.quantity.toString())!,
                    SizedBox(width: width * 0.05),
                    Container(
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: kSilver,
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          final docCartProduct = FirebaseFirestore.instance
                              .collection('user')
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .collection('cart')
                              .doc(cart.productname + cart.size);

                          docCartProduct
                              .update({"quantity": cart.quantity + 1});
                          log(index.toString());
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    const Spacer(),
                    currency(
                        14, kDarkColor, int.parse(cart.price) * cart.quantity)!
                  ],
                ),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder(
                      stream: controller.readWishlist(),
                      builder: (context, snapshot) {
                        // final wishlist = snapshot.data;
                        return GestureDetector(
                          onTap: () {},
                          child: const TextIconButton(
                            icon: Icons.archive_outlined,
                            label: 'wishlist',
                          ),
                        );
                      },
                    ),
                    TextIconButton(
                      icon: Icons.delete,
                      label: 'Remove',
                      productname: cart.productname,
                      size: cart.size,
                    ),
                    // const TextIconButton(
                    //   icon: Icons.flash_on,
                    //   label: 'Buy this now',
                    // ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
