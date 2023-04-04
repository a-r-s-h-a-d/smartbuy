// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:smartbuy/services/models/products/model_product.dart';
// import 'package:smartbuy/utils/constants.dart';

// Stream<List<Products>> readWishlist() => FirebaseFirestore.instance
//     .collection('user')
//     .doc(userEmail)
//     .collection('wishlist')
//     .snapshots()
//     .map((snapshot) =>
//         snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
