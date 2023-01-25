import 'dart:developer';

import 'package:get/get.dart';
import 'package:smartbuy/services/models/address/model_address.dart';
import 'package:smartbuy/utils/constants.dart';

class AddressController extends GetxController {
  int groupValue = box.read('curaddress') ?? -1;
  String? fullname;
  String? housenoorbuildingname;
  String? roadareacolony;
  String? city;
  String? state;
  String? pincode;
  String? phoneNumber;

  setAddress(value) {
    groupValue = value;
    update();
  }

  changeAddressonCheckout(ModelAddress? instanceofaddress) {
    log('change Address in Address Controller');
    fullname = instanceofaddress!.fullname;
    housenoorbuildingname = instanceofaddress.housenoorbuildingname;
    roadareacolony = instanceofaddress.roadareacolony;
    city = instanceofaddress.city;
    state = instanceofaddress.city;
    state = instanceofaddress.state;
    pincode = instanceofaddress.pincode;
    phoneNumber = instanceofaddress.phoneNumber;
    update();
  }
}
