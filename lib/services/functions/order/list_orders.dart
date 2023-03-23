import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartbuy/services/models/order/model_order.dart';

Stream<List<ModelOrder>> listOrder() => FirebaseFirestore.instance
    .collection('smartbuy')
    .doc('admin')
    .collection('order')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ModelOrder.fromJson(doc.data())).toList());
