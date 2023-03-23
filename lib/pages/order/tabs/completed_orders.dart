import 'package:flutter/material.dart';
import 'package:smartbuy/pages/order/widgets/build_order.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: buildOrder(height, width, tab: 'completed'));
  }
}
