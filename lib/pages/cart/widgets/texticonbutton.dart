import 'package:flutter/material.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class TextIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const TextIconButton({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: kDarkColor,
        ),
        label: boldTextStyle(8.8, kDarkColor, label)!);
  }
}