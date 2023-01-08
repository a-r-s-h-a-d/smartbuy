import 'package:flutter/material.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color labelColor;
  final String label;
  final Color boxColor;
  const AppLogo({
    required this.size,
    required this.labelColor,
    required this.label,
    required this.boxColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.08,
      width: width * 0.21,
      decoration: BoxDecoration(
        borderRadius: kBradius10,
        color: boxColor,
      ),
      child: Center(
        child: boldTextStyle(size, labelColor, label),
      ),
    );
  }
}
