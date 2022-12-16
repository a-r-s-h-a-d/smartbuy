import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

class PaymentMethod extends StatelessWidget {
  final String method;
  final int value;
  const PaymentMethod({
    required this.method,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: 1,
          onChanged: (value) {},
        ),
        kwidth20,
        boldTextStyle(14, kDarkColor, method)!,
      ],
    );
  }
}
