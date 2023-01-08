import 'package:flutter/material.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class BrandCircle extends StatelessWidget {
  final String image;
  final String label;
  const BrandCircle({
    required this.image,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kBlackColor,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(image),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          child: regularTextStyle(10, ksilverOriginal, label, 1),
        )
      ],
    );
  }
}
