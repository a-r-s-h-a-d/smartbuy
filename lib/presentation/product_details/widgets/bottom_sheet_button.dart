import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/address/screen_address.dart';
import 'package:smartbuy/presentation/main_page/widgets/bottom_nav.dart';

class BottomSheetButton extends StatelessWidget {
  final String label;
  final Color buttoncolor;
  final Color labelcolor;

  const BottomSheetButton({
    required this.label,
    required this.buttoncolor,
    required this.labelcolor,
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.07,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttoncolor),
        ),
        onPressed: () {
          if (label == 'Add to Cart') {
            Get.back();
            indexChangeNotifier.value = 2;
          } else {
            Get.to(() => const ScreenAddress(screenname: 'Ship To'));
          }
        },
        child: boldTextStyle(13, labelcolor, label),
      ),
    );
  }
}
