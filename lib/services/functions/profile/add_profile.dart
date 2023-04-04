import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartbuy/services/models/profile/model_profile.dart';
import 'package:smartbuy/utils/constants.dart';

void addProfile({
  required String name,
  required String dob,
  required String profileUrl,
  required String phone,
}) async {
  final docProfile = FirebaseFirestore.instance
      .collection('user')
      .doc(userEmail)
      .collection('profile')
      .doc(userEmail);

  final profile = ModelProfile(
    id: userEmail!,
    name: name,
    email: userEmail!,
    dob: dob,
    mobilenumber: phone,
    profileUrl: profileUrl,
  );

  final json = profile.toJson();

  await docProfile.set(json);
}
