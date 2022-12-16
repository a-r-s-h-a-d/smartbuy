import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/notifications/screen_notification.dart';
import 'package:smartbuy/presentation/view_products_and_wishlist/view_products_and_wishlist.dart';

class CustomHomeNotificationAppBar extends StatelessWidget {
  const CustomHomeNotificationAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight30,
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const Expanded(
                child: CupertinoSearchTextField(
                  placeholder: 'Search Product',
                  placeholderStyle: TextStyle(
                    color: kSilver,
                    fontSize: 12,
                  ),
                  itemColor: kBlueColor,
                  itemSize: 18,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() =>
                      const ViewProductsandWishlist(screenname: 'wishlist'));
                },
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => const ScreenNotification());
                },
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
        ),
        kheight20,
        //const Divider(thickness: 1),
      ],
    );
  }
}
