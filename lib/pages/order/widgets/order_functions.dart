import 'package:flutter/material.dart';
import 'package:smartbuy/pages/home/widgets/heading2.dart';
import 'package:smartbuy/services/models/order/model_order.dart';
import 'package:smartbuy/utils/constants.dart';

orderStatus({required int orderStatus, required bool iscancelled}) {
  if (orderStatus == 1 && !iscancelled) {
    return 'Order Placed';
  } else if (orderStatus == 2 && !iscancelled) {
    return 'Order Packed';
  } else if (orderStatus == 3 && !iscancelled) {
    return 'Order Shipped';
  } else if (orderStatus == 4) {
    return 'Order Delivered';
  } else if (iscancelled) {
    return 'Order Cancelled';
  }
}

class OrderStatusDates extends StatelessWidget {
  const OrderStatusDates({
    super.key,
    required this.orderList,
    required this.index,
    required this.orderstatusno,
    required this.status,
    required this.date,
  });

  final List<ModelOrder>? orderList;
  final int index;
  final int orderstatusno;
  final String status;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: orderList![index].orderstatus >= orderstatusno ? true : false,
      child: Heading2(
        title: status,
        navtitle: date.toString(),
        titlesize: 12,
        navtitlesize: 10,
      ),
    );
  }
}

bool orderVisibility({
  required String tab,
  required int statusno,
  bool? isCancelled,
  required List<ModelOrder> orderList,
  required int index,
}) {
  if (tab == 'active' &&
      statusno >= 0 &&
      statusno < 4 &&
      !isCancelled! &&
      userEmail == orderList[index].userEmail) {
    return true;
  } else if (tab == 'completed' &&
      statusno == 4 &&
      userEmail == orderList[index].userEmail) {
    return true;
  } else if (tab == 'cancelled' &&
      isCancelled == true &&
      userEmail == orderList[index].userEmail) {
    return true;
  }
  return false;
}
