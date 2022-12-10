import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/account/widgets/account_tile.dart';
import 'package:smartbuy/presentation/profile/screen_profile.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: boldTextStyle(15, kDarkColor, 'My Account'),
          ),
        ),
        body: ListView(
          children: const [
            AccountTile(
                icon: Icons.person_outline,
                title: 'Profile',
                route: ScreenProfile()),
            AccountTile(
              icon: Icons.shopping_bag_outlined,
              title: 'Order',
              route: ScreenProfile(),
            ),
            AccountTile(
              icon: Icons.location_on_outlined,
              title: 'Address',
              route: ScreenProfile(),
            ),
            AccountTile(
              icon: Icons.payment,
              title: 'Payment',
              route: ScreenProfile(),
            ),
          ],
        ));
  }
}
