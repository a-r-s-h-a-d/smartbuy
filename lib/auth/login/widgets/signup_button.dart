import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/services/functions/auth_service/auth_service.dart';
import 'package:smartbuy/utils/styles.dart';

class SignUpButton extends StatelessWidget {
  final String imagePath;
  final String buttonName;
  final double size;

  SignUpButton({
    required this.imagePath,
    required this.buttonName,
    required this.size,
    Key? key,
  }) : super(key: key);
  final AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      child: Card(
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              width: 1,
              color: Colors.grey,
            )),
        child: InkWell(
          onTap: () async {
            buttonName == 'Continue with Google'
                ? await authClass.googleSignIn(context)
                : null;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
                height: 25,
                width: 25,
              ),
              const SizedBox(width: 25),
              boldTextStyle(size, kBlackColor, buttonName)!
            ],
          ),
        ),
      ),
    );
  }
}
