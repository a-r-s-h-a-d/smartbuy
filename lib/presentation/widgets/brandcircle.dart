import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

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
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFFD0D0D0),
          child: ClipRRect(
            child: Image(
              image: NetworkImage(image),
              width: 50,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          child: regularTextStyle(10, ksilverOriginal, label),
        )
      ],
    );
  }
}
