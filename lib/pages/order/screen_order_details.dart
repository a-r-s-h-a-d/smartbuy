import 'package:easy_stepper/easy_stepper.dart';
import 'package:smartbuy/pages/home/widgets/heading2.dart';
import 'package:smartbuy/services/models/order/model_order.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenOrderDetails extends StatelessWidget {
  final List<ModelOrder>? orderList;
  final int index;
  const ScreenOrderDetails({
    super.key,
    required this.orderList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<String> addresssplittedform = orderList![index].address.split(',');
    String addressList = addresssplittedform.join('\n');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: boldTextStyle(15, kDarkColor, orderList![index].orderid),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: ListView(
          children: [
            //Order Status
            boldTextStyle(16, kDarkColor, 'Order Status')!,
            kheight10,
            orderList![index].isCancelled
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: boldTextStyle(16, kBlackColor, 'Order Cancelled'),
                    ),
                  )
                : EasyStepper(
                    direction: Axis.horizontal,
                    padding: 0,
                    stepRadius: width * 0.065,
                    lineLength: width * 0.1,
                    steps: getSteps(),
                    activeStep: orderList![index].orderstatus,
                  ),
            kheight10,
            //status dates
            // boldTextStyle(16, kDarkColor, 'Dates')!,
            // OrderStatusDates(
            //   orderList: orderList,
            //   index: index,
            //   orderstatusno: 1,
            //   status: 'Order Placed',
            //   date: orderList![index].ordertime,
            // ),
            // OrderStatusDates(
            //   orderList: orderList,
            //   index: index,
            //   orderstatusno: 2,
            //   status: 'Order Packed',
            //   date: '',
            // ),
            // OrderStatusDates(
            //   orderList: orderList,
            //   index: index,
            //   orderstatusno: 3,
            //   status: 'Order Shipped',
            //   date: '',
            // ),
            // OrderStatusDates(
            //   orderList: orderList,
            //   index: index,
            //   orderstatusno: 4,
            //   status: 'Order Delivered',
            //   date: '',
            // ),
            kheight10,
            SizedBox(
              height: height * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldTextStyle(16, kDarkColor, 'Billing Address')!,
                  boldTextStyle(12, kBlackColor,
                      '${orderList![index].customername}\n $addressList')!,
                ],
              ),
            ),
            //Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boldTextStyle(16, kDarkColor, 'Price Details')!,
                SizedBox(height: height * 0.005),
                Heading2(
                  title: 'Product name',
                  navtitle: orderList![index].productname,
                  titlesize: 13,
                  navtitlesize: 12,
                ),
                Heading2(
                  title: 'Price',
                  navtitle: orderList![index].price,
                  titlesize: 13,
                  navtitlesize: 12,
                ),
                Heading2(
                  title: 'Quanty',
                  navtitle: orderList![index].quantity,
                  titlesize: 13,
                  navtitlesize: 12,
                ),
                Heading2(
                  title: 'Payment Status',
                  navtitle: orderList![index].paymentStatus,
                  titlesize: 13,
                  navtitlesize: 12,
                ),
              ],
            ),
            kheight10,
            //Order items
            boldTextStyle(16, kDarkColor, 'Photo')!,
            kheight10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.32,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(orderList![index].productimage),
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<EasyStep> getSteps() => const [
        EasyStep(
          icon: Icon(Icons.add_shopping_cart_outlined),
          title: 'Order Placed',
        ),
        EasyStep(
          icon: Icon(Icons.check_box_rounded),
          title: 'Order Packed',
        ),
        EasyStep(
          icon: Icon(Icons.local_shipping),
          title: 'Shipping',
        ),
        EasyStep(
          icon: Icon(Icons.card_giftcard_outlined),
          title: 'Delivered',
        ),
      ];
}
