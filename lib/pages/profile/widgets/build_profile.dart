import 'package:flutter/material.dart';
import 'package:smartbuy/pages/account&add_profile/widgets/account_tile.dart';
import 'package:smartbuy/services/models/profile/model_profile.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';

class BuildProfile extends StatelessWidget {
  const BuildProfile({
    super.key,
    required this.height,
    required this.profile,
  });

  final double height;
  final List<ModelProfile> profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: kBlueColor.withOpacity(0.2),
                radius: height * 0.08,
                child: ClipOval(
                  child: Image.network(
                    profile[0].profileUrl,
                    fit: BoxFit.cover,
                    width: height * 0.15,
                    height: height * 0.15,
                  ),
                ),
              ),
              FractionalTranslation(
                translation: const Offset(4.2, 3.8),
                child: CircleAvatar(
                  radius: height * 0.015,
                  backgroundColor: kBlueColor.withOpacity(0.9),
                  child: const Icon(
                    Icons.verified,
                    size: 12.0,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        kheight30,
        AccountTile(
          icon: Icons.person_4_sharp,
          title: profile[0].name,
        ),
        kheight10,
        AccountTile(
          icon: Icons.email,
          title: profile[0].email,
        ),
        kheight10,
        AccountTile(
          icon: Icons.calendar_month,
          title: profile[0].dob,
        ),
        kheight10,
        AccountTile(
          icon: Icons.phone_android,
          title: profile[0].mobilenumber,
        ),
      ],
    );
  }
}
