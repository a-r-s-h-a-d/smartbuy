import 'package:flutter/material.dart';
import 'package:smartbuy/pages/order/widgets/build_order.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: buildOrder(height, width, tab: 'active'));
  }
}
