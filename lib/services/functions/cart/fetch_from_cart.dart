import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartbuy/services/models/cart/model_cart.dart';

Stream<List<ModelCart>> fetchDatafromCart() => FirebaseFirestore.instance
    .collection('user')
    .doc(FirebaseAuth.instance.currentUser!.email)
    .collection('cart')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ModelCart.fromJson(doc.data())).toList());
