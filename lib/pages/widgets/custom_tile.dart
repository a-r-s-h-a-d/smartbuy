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
    return ListTile(
      leading: regularTextStyle(12, ksilverOriginal, title, 1),
      trailing: regularTextStyle(12, kBlackColor, trailing, 1),
    );
  }
}
