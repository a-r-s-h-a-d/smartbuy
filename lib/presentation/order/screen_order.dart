import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/order/screen_order_details.dart';
import 'package:smartbuy/presentation/product_details/screen_product_details.dart';

class ScreenOrder extends StatelessWidget {
  const ScreenOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'Order'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) => kheight20,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Get.to(() => const ScreenOrderDetails()),
            child: Container(
              height: height * 0.3,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: boldTextStyle(14, kDarkColor, 'Order ${index + 1}')!,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: regularTextStyle(
                        12, kSilver, 'Order at 1${index + 1} December 2022')!,
                  ),
                  const CustomTile(title: 'Order Status', trailing: 'Shipping'),
                  const CustomTile(
                      title: 'Items', trailing: '2 Items Purchased'),
                  const CustomTile(title: 'Price', trailing: '₹7650')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
