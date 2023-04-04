import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smartbuy/services/models/products/model_product.dart';
import 'package:smartbuy/utils/constants.dart';

class WishlistController extends GetxController {
  void addtoWishlist(Products products) async {
    final docWishlist = FirebaseFirestore.instance
        .collection('user')
        .doc(userEmail)
        .collection('wishlist')
        .doc(products.productname);

    final wishlist = Products(
      productname: products.productname,
      brand: products.brand,
      productimages: products.productimages,
      price: products.price,
      size: products.size,
      description: products.description,
    );

    final json = wishlist.toJson();

    await docWishlist.set(json);
  }

  void removefromWishlist(Products products) async {
    final docWishlist = FirebaseFirestore.instance
        .collection('user')
        .doc(userEmail)
        .collection('wishlist')
        .doc(products.productname);

    await docWishlist.delete();
  }

  Stream<List<Products>> readWishlist() => FirebaseFirestore.instance
      .collection('user')
      .doc(userEmail)
      .collection('wishlist')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
