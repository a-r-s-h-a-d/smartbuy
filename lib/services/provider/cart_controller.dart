import 'package:get/get.dart';

class CartController extends GetxController {
  int count = 1;
  int price = 7500;
  void productIncrement() {
    count++;
    update();
  }

  void productDecrement() {
    count--;
    update();
  }
}
