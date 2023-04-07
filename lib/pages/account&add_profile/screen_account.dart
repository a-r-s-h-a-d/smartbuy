import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/pages/account&add_profile/screen_add_profile.dart';
import 'package:smartbuy/pages/account&add_profile/screen_edit_profile.dart';
import 'package:smartbuy/pages/profile/widgets/build_profile.dart';
import 'package:smartbuy/services/functions/auth_service/auth_service.dart';
import 'package:smartbuy/services/functions/profile/read_profile.dart';
import 'package:smartbuy/services/models/profile/model_profile.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    List<ModelProfile>? profile;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.12),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'My Account'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () async {
                  AuthClass().signOut(context);
                },
                icon: const Icon(Icons.exit_to_app),
                color: kDarkColor,
                iconSize: 30,
              ),
            )
          ],
        ),
      ),
      body: StreamBuilder(
        stream: readProfile(),
        builder: (context, snapshot) {
          profile = snapshot.data;
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went Wrong'),
            );
          } else if (snapshot.hasData) {
            if (profile!.isEmpty) {
              return Center(
                child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => ScreenAddProfile());
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Profile')),
              );
            } else {
              return BuildProfile(height: height, profile: profile!);
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: StreamBuilder(
        stream: readProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data == null ||
              (snapshot.data as List).isEmpty) {
            return Container();
          }
          return FloatingActionButton(
            onPressed: () {
              Get.to(ScreenEditProfile(profile: profile!));
            },
            child: const Icon(
              Icons.edit,
              color: kWhiteColor,
            ),
          );
        },
      ),
    );
  }
}
