import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: boldTextStyle(18, kDarkColor, title),
    );
  }
}
