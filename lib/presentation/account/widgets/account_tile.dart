import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

class AccountTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget route;
  const AccountTile({
    required this.icon,
    required this.title,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30, color: kBlueColor),
      title: regularTextStyle(14, kDarkColor, title),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => route,
      )),
    );
  }
}
