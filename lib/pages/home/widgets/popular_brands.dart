import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/screen_products_and_wishlist/screen_products_and_wishlist.dart';
import 'package:smartbuy/pages/widgets/brandcircle.dart';
import 'package:smartbuy/services/models/brand/brand.dart';

class PopularBrands extends StatelessWidget {
  const PopularBrands({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .13,
      child: StreamBuilder(
        stream: listBrands(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final brands = snapshot.data;

            return ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemExtent: 90,
              scrollDirection: Axis.horizontal,
              children: brands!.map(buildBrands).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildBrands(Brand brand) => GestureDetector(
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
  Stream<List<Brand>> listBrands() => FirebaseFirestore.instance
      .collection('brands')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Brand.fromJson(doc.data())).toList());
}
