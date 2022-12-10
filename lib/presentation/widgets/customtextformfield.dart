import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextInputType keyboardType;
  const CustomTextFormField({
    required this.icon,
    required this.label,
    required this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        labelStyle: const TextStyle(color: kSilver, fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
