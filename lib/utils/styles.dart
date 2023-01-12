import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartbuy/utils/colors.dart';

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

Widget? regularTextStyle(double size, Color color, String text, int maxlines) {
  return Text(
    text,
    maxLines: maxlines,
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
    style: TextStyle(
      fontFamily: 'Poppins bold',
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget? currency(double size, Color color, int number) {
  return Text(
    NumberFormat.simpleCurrency(locale: 'hi-IN', decimalDigits: 2)
        .format(number),
    style: TextStyle(
      fontFamily: 'Poppins bold',
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}
