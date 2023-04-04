import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileController extends GetxController {
  final TextEditingController controller = TextEditingController();
  String? pickedFile;
  var uploadTask;

  selectFile() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    pickedFile = result.path;
    update();
  }

  Future<String> uploadFile() async {
    try {
      final file = File(pickedFile!);
      final fileName = Uri.file(pickedFile!).pathSegments.last;
      String path = 'profile/$fileName';
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      log('Download Link: $urlDownload');
      return urlDownload;
    } catch (e) {
      log('Error uploading file: $e');
      rethrow;
    }
  }

//date picker for birthday
  Future<void> selectDate(BuildContext context) async {
    DateTime? selectedDate;
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (date != null) {
      selectedDate = date;
      controller.text = DateFormat('dd/MM/yyyy').format(date);
    }
  }
}
