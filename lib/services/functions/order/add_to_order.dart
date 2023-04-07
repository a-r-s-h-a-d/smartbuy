import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartbuy/services/models/order/model_order.dart';
import 'package:smartbuy/utils/constants.dart';

Future addOrderDetailsinOrder({
  required String orderid,
  required String customername,
  required String address,
  required String ordertime,
  required String productname,
  required String productimage,
  required String size,
  required String quantity,
  required String price,
  required int orderStatus,
  required String paymentStatus,
  bool? isCancelled,
}) async {
  final docOrder = FirebaseFirestore.instance
      .collection('smartbuy')
      .doc('admin')
      .collection('order')
      .doc(
        userEmail! + orderid,
      );

  final orderDetails = ModelOrder(
    orderid: orderid,
    customername: customername,
    userEmail: userEmail!,
    address: address,
    ordertime: ordertime,
    productname: productname,
    productimage: productimage,
    size: size,
    quantity: quantity,
    price: price,
    orderstatus: orderStatus,
    paymentStatus: paymentStatus,
    isCancelled: false,
    isDelivered: false,
  );

  final json = orderDetails.toJson();

  await docOrder.set(json);
}
