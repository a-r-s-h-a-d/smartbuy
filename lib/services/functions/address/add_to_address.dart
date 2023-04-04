import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartbuy/services/models/address/model_address.dart';
import 'package:smartbuy/utils/constants.dart';

Future addtoAddress(
    {required String fullname,
    required String phoneNumber,
    required String pincode,
    required String state,
    required String city,
    required String housenoorbuildingname,
    required String roadareacolony}) async {
  final docAddress = FirebaseFirestore.instance
      .collection('user')
      .doc(userEmail)
      .collection('address')
      .doc(housenoorbuildingname);

  final address = ModelAddress(
      id: docAddress.id,
      fullname: fullname,
      phoneNumber: phoneNumber,
      pincode: pincode,
      state: state,
      city: city,
      housenoorbuildingname: housenoorbuildingname,
      roadareacolony: roadareacolony);

  final json = address.toJson();

  await docAddress.set(json);
}
