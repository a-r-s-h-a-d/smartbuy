import 'package:flutter/material.dart';
import 'package:smartbuy/pages/order/tabs/active_orders.dart';
import 'package:smartbuy/pages/order/tabs/cancelled_orders.dart';
import 'package:smartbuy/pages/order/tabs/completed_orders.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenOrder extends StatelessWidget {
  const ScreenOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: const Color(0xFFF4F5FA),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: boldTextStyle(15, kDarkColor, '📦 Orders'),
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
                  Tab(
                    text: 'Cancelled',
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(children: [
            ActiveOrders(),
            CompletedOrders(),
            CancelledOrders(),
          ])),
    );
  }
}
