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
        Container(
          width: 65.0,
          height: 65.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.contain,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: ksilverOriginal,
              width: 1.0,
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
