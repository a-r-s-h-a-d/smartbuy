import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';

BorderRadius kBradius10 = BorderRadius.circular(10);
SizedBox kheight10 = const SizedBox(height: 10);
SizedBox kheight20 = const SizedBox(height: 20);
SizedBox kheight30 = const SizedBox(height: 30);
SizedBox kheight50 = const SizedBox(height: 50);
SizedBox kwidth20 = const SizedBox(width: 20);

TextStyle klogoStyle1 = const TextStyle(
  fontFamily: 'Poppins',
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: kBlueColor,
);
TextStyle klogoStyle2 = const TextStyle(
  fontFamily: 'Poppins',
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: kWhiteColor,
);

TextStyle kheading1 = const TextStyle(
  fontFamily: 'Poppins bold',
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: kDarkColor,
);

Widget? regularTextStyle(double size, Color color, String text) {
  return Text(
    text,
    // maxLines: 8,
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget? boldTextStyle(double size, Color color, String text) {
  return Text(
    text,
    // maxLines: 2,
    style: TextStyle(
      fontFamily: 'Poppins bold',
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}
