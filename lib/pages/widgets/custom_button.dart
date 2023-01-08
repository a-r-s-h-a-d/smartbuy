import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const Button({
    required this.icon,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 30,
            )),
      ],
    );
  }
}
