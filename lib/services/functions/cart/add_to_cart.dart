import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartbuy/services/models/cart/model_cart.dart';

Future addtoCart({
  required String productName,
  required String productImage,
  required String price,
  required String productSize,
}) async {
  final docCart = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('cart')
      .doc(productName + productSize);

  final cart = ModelCart(
      id: docCart.id,
      productname: productName,
      productimage: productImage,
      price: price,
      size: productSize,
      quantity: 1);

  final cartjsonformat = cart.toJson();

  await docCart.set(cartjsonformat);
}
