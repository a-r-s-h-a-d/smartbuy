import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

BorderRadius kBradius10 = BorderRadius.circular(10);
BorderRadius kBradius15 = BorderRadius.circular(15);
SizedBox kheight10 = const SizedBox(height: 10);
SizedBox kheight20 = const SizedBox(height: 20);
SizedBox kheight30 = const SizedBox(height: 30);
SizedBox kheight50 = const SizedBox(height: 50);
SizedBox kwidth20 = const SizedBox(width: 20);

final userEmail = FirebaseAuth.instance.currentUser!.email;

final box = GetStorage();
