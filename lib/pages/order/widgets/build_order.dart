import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smartbuy/pages/home/widgets/heading2.dart';
import 'package:smartbuy/pages/order/screen_order_details.dart';
import 'package:smartbuy/pages/order/widgets/order_functions.dart';
import 'package:smartbuy/services/functions/order/list_orders.dart';
import 'package:smartbuy/services/models/order/model_order.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

StreamBuilder<List<ModelOrder>> buildOrder(double height, double width,
    {required String tab}) {
  return StreamBuilder(
    stream: listOrder(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final orderList = snapshot.data;
        if (orderList!.isEmpty) {
          return Center(
            child: Lottie.asset(
              'assets/animation/empty_order_new.json',
              fit: BoxFit.cover,
              repeat: true,
            ),
          );
        } else {
          return ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(() => ScreenOrderDetails(
                        orderList: orderList,
                        index: index,
                      )),
                  child: Visibility(
                    visible: orderVisibility(
                      tab: tab,
                      statusno: orderList[index].orderstatus,
                      isCancelled: orderList[index].isCancelled,
                    ),
                    child: Container(
                      height: height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: kBradius10,
                        color: kWhiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Heading2(
                              title: 'Order ID',
                              navtitle: orderList[index].orderid,
                              titlesize: 11,
                              navtitlesize: 11,
                            ),
                            Heading2(
                              title: 'Order Time',
                              navtitle: orderList[index].ordertime,
                              titlesize: 11,
                              navtitlesize: 11,
                            ),
                            Heading2(
                              title: 'Order Status',
                              navtitle: orderStatus(
                                orderStatus: orderList[index].orderstatus,
                                iscancelled: orderList[index].isCancelled,
                              ),
                              titlesize: 11,
                              navtitlesize: 11,
                            ),
                            Heading2(
                              title: 'Amount',
                              navtitle: orderList[index].price,
                              titlesize: 11,
                              navtitlesize: 11,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                boldTextStyle(
                                    12, kBlackColor, 'Payment Status')!,
                                Container(
                                  height: height * 0.03,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    color:
                                        orderList[index].paymentStatus == 'Paid'
                                            ? kgreen
                                            : korangePeel,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: regularTextStyle(10, kWhiteColor,
                                          orderList[index].paymentStatus, 1)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => kheight20,
              itemCount: orderList.length);
        }
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
