import 'package:get/get.dart';

class PaymentController extends GetxController {
  int groupValue = 0;
  void changeGroupValue(int value) {
    groupValue = value;
    update();
  }
}
