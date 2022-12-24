import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

class ReviewFilter extends StatelessWidget {
  final String text;
  const ReviewFilter({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: const Icon(
          Icons.star,
          color: Color(0xFFFFD700),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kSilver,
          disabledBackgroundColor: kWhiteColor,
        ),
        onPressed: () {},
        label: regularTextStyle(12, kDarkColor, text)!);
  }
}
