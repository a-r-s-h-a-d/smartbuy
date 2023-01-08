import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/pages/address/screen_address.dart';
import 'package:smartbuy/pages/widgets/custom_tile.dart';
import 'package:smartbuy/utils/styles.dart';

class CartProductDetails extends StatelessWidget {
  const CartProductDetails({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .36,
      decoration: BoxDecoration(
        border: Border.all(color: kSilver),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const CustomTile(title: 'Items(10)', trailing: '₹7500'),
          const CustomTile(title: 'Shipping', trailing: '₹40'),
          const CustomTile(title: 'Import Charges', trailing: '₹110'),
          const CustomTile(title: 'Total Amount', trailing: '₹7650'),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: height * .06,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const ScreenAddress(screenname: 'Ship To'));
                    },
                    child: boldTextStyle(14, kWhiteColor, 'Place Order'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
