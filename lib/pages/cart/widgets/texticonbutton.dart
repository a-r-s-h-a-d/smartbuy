import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class TextIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? productname;
  final String? size;
  const TextIconButton({
    required this.icon,
    required this.label,
    Key? key,
    this.productname,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          if (label == 'Remove') {
            final docCart = FirebaseFirestore.instance
                .collection('user')
                .doc(userEmail.toString())
                .collection('cart')
                .doc(productname! + size!);

            QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              title: 'Warning',
              text: 'Are you sure you want to remove this item?',
              confirmBtnText: 'Remove',
              confirmBtnTextStyle:
                  const TextStyle(fontSize: 14, color: kWhiteColor),
              cancelBtnTextStyle:
                  const TextStyle(fontSize: 14, color: kBlueColor),
              onConfirmBtnTap: () async {
                Get.back();
                await docCart.delete();
              },
            );
          }
        },
        icon: Icon(
          icon,
          color: kDarkColor,
        ),
        label: boldTextStyle(8.8, kDarkColor, label)!);
  }
}
