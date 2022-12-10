import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/account/widgets/account_tile.dart';
import 'package:smartbuy/presentation/profile/edit/gender.dart';
import 'package:smartbuy/presentation/profile/edit/name.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'Profile'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                  child: Image.asset(
                'assets/images/temp_profile.jpg',
                height: height * 0.15,
              )),
            ),
            kheight50,
            const AccountTile(
              icon: Icons.person_outline,
              title: 'Muhammed Arshad K A',
              route: FullName(),
            ),
            kheight10,
            const AccountTile(
              icon: Icons.male_outlined,
              title: 'Male',
              route: Gender(),
            ),
            kheight10,
            const AccountTile(
              icon: Icons.calendar_month,
              title: '16-05-2000',
              route: ScreenProfile(),
            ),
            kheight10,
            const AccountTile(
              icon: Icons.email_outlined,
              title: 'arshad@gmail.com',
              route: ScreenProfile(),
            ),
            kheight10,
            const AccountTile(
              icon: Icons.smartphone,
              title: '9446854779',
              route: ScreenProfile(),
            ),
            kheight10,
            const AccountTile(
              icon: Icons.lock_outline,
              title: 'Change Password',
              route: ScreenProfile(),
            ),
          ],
        ),
      ),
    );
  }
}
