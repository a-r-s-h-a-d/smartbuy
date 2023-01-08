import 'package:flutter/material.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

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
        label: regularTextStyle(12, kDarkColor, text, 5)!);
  }
}
