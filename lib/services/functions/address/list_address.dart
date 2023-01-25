import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartbuy/services/models/address/model_address.dart';
import 'package:smartbuy/utils/constants.dart';

Stream<List<ModelAddress>> readAddress() => FirebaseFirestore.instance
    .collection('user')
    .doc(userEmail)
    .collection('address')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ModelAddress.fromJson(doc.data())).toList());
