import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/pages/account&add_profile/widgets/account_tile.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: kDarkColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'Settings'),
        ),
      ),
      body: Column(
        children: const [
          AccountTile(
            icon: Icons.admin_panel_settings_outlined,
            title: 'Terms and Conditions',
            // route: ScreenSettings(),
          ),
          AccountTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            // route: ScreenSettings(),
          ),
          AccountTile(
            icon: Icons.refresh_rounded,
            title: 'Returns,Refunds and Replacement Policy',
            // route: ScreenSettings(),
          ),
          AccountTile(
            icon: Icons.star_border,
            title: 'Rate smartbuy',
            // route: ScreenSettings(),
          ),
          AccountTile(
            icon: Icons.share,
            title: 'Share',
            // route: ScreenSettings(),
          ),
        ],
      ),
    );
  }
}
