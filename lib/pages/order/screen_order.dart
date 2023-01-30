import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:smartbuy/pages/order/tabs/active_orders.dart';
import 'package:smartbuy/pages/order/tabs/completed_orders.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/order/screen_order_details.dart';
import 'package:smartbuy/pages/widgets/custom_tile.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenOrder extends StatelessWidget {
  const ScreenOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),
            child: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: boldTextStyle(15, kDarkColor, 'Orders'),
              centerTitle: true,
              bottom: const TabBar(
                labelColor: kDarkColor,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    text: 'Active',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(children: [
            ActiveOrders(),
            CompletedOrders(),
          ])),
    );
  }
}
