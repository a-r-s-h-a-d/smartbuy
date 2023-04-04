import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartbuy/utils/constants.dart';

void removeaddress(String housenoorbuildingname) {
  final docAddress = FirebaseFirestore.instance
      .collection('user')
      .doc(userEmail)
      .collection('address')
      .doc(housenoorbuildingname)
      .delete();
}
