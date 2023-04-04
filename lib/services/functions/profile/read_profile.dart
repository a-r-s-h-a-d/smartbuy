import 'package:smartbuy/services/models/profile/model_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartbuy/utils/constants.dart';

Stream<List<ModelProfile>> readProfile() => FirebaseFirestore.instance
    .collection('user')
    .doc(userEmail)
    .collection('profile')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ModelProfile.fromJson(doc.data())).toList());
