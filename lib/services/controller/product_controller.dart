import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool isIcon = false;
  IconData icon = Icons.favorite_border;

  void isFav() {
    isIcon = !isIcon;
    icon = isIcon ? Icons.favorite : Icons.favorite_border;
    update();
  }
}
