import 'package:flutter/material.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class Heading2 extends StatelessWidget {
  final String title;
  final String navtitle;
  final double titlesize;
  final double navtitlesize;
  const Heading2({
    required this.title,
    required this.navtitle,
    Key? key,
    required this.titlesize,
    required this.navtitlesize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        boldTextStyle(titlesize, kBlackColor, title)!,
        boldTextStyle(navtitlesize, kBlackColor, navtitle)!
      ],
    );
  }
}
