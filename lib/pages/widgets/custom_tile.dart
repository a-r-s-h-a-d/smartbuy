import 'package:flutter/material.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String trailing;

  const CustomTile({
    required this.title,
    required this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              boldTextStyle(13, kDarkColor, title)!,
              boldTextStyle(12, kBlackColor, trailing)!,
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        )
      ],
    );
  }
}
