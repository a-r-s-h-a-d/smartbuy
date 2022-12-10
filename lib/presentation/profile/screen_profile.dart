import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/account/widgets/account_tile.dart';
import 'package:smartbuy/presentation/profile/widgets/custom_editprofile.dart';
import 'package:smartbuy/presentation/profile/widgets/gender.dart';

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
        child: SingleChildScrollView(
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
                route: CustomEditScreen(
                    fieldname: 'Full Name',
                    icon: Icons.person_outline,
                    keyboardtype: TextInputType.name),
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
                route: CustomEditScreen(
                    fieldname: 'Date of Birth',
                    icon: Icons.calendar_month,
                    keyboardtype: TextInputType.datetime),
              ),
              kheight10,
              const AccountTile(
                icon: Icons.mail_outline,
                title: 'arshad@gmail.com',
                route: CustomEditScreen(
                    fieldname: 'e-mail',
                    icon: Icons.mail_outline,
                    keyboardtype: TextInputType.emailAddress),
              ),
              kheight10,
              const AccountTile(
                icon: Icons.smartphone,
                title: '+91 9446854779',
                route: CustomEditScreen(
                    fieldname: 'Phone Number',
                    icon: Icons.smartphone,
                    keyboardtype: TextInputType.emailAddress),
              ),
              kheight10,
              const AccountTile(
                icon: Icons.lock_outline,
                title: 'Change Password',
                route: CustomEditScreen(
                    fieldname: 'Old Password',
                    icon: Icons.lock_outline,
                    keyboardtype: TextInputType.visiblePassword),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
