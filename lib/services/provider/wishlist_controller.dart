import 'package:get/get.dart';

class WishlistController extends GetxController {
  bool isadded = false;

  void addorremovefromwishlist() {
    isadded = isadded == false ? true : false;
    update();
  }
}
