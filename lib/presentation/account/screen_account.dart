import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/account/widgets/account_tile.dart';
import 'package:smartbuy/presentation/address/screen_address.dart';
import 'package:smartbuy/presentation/login/screen_login.dart';
import 'package:smartbuy/presentation/order/screen_order.dart';
import 'package:smartbuy/presentation/payment/screen_payment.dart';
import 'package:smartbuy/presentation/profile/screen_profile.dart';
import 'package:smartbuy/presentation/settings/screen_settings.dart';

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
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () => Get.offAll(() => ScreenLogin()),
                  icon: const Icon(Icons.exit_to_app),
                  color: kDarkColor,
                  iconSize: 30,
                ),
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            AccountTile(
                icon: Icons.person_outline,
                title: 'Profile',
                route: ScreenProfile()),
            const AccountTile(
              icon: Icons.shopping_bag_outlined,
              title: 'Order',
              route: ScreenOrder(),
            ),
            const AccountTile(
              icon: Icons.location_on_outlined,
              title: 'Address',
              route: ScreenAddress(screenname: 'Address'),
            ),
            const AccountTile(
              icon: Icons.payment,
              title: 'Payment',
              route: ScreenPayment(),
            ),
            const AccountTile(
              icon: Icons.settings,
              title: 'Settings',
              route: ScreenSettings(),
            ),
          ],
        ));
  }
}
