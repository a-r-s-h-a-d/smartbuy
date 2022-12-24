import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

class SizeAndColor extends StatelessWidget {
  final String? size;
  final Color? color;
  const SizeAndColor({
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 21,
      backgroundColor: kBlackColor,
      child: CircleAvatar(
        foregroundColor: kBlackColor,
        backgroundColor: color == color ? color : Colors.transparent,
        child: size == null
            ? const Text('')
            : boldTextStyle(22, kDarkColor, size!),
      ),
    );
  }
}
