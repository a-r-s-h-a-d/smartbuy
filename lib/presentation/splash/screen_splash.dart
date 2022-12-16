import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/presentation/login/screen_login.dart';
import 'package:smartbuy/presentation/widgets/app_logo.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  void initState(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3), () => Get.off(() => const ScreenLogin()));
  }

  @override
  Widget build(BuildContext context) {
    initState(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBlueColor,
      body: Center(
        child: SizedBox(
          height: height * 0.11,
          width: width * 0.27,
          child: const AppLogo(
            labelColor: kBlueColor,
            label: 'smartbuy',
            size: 14,
            boxColor: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
