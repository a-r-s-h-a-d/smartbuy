import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/home/widgets/heading.dart';
import 'package:smartbuy/presentation/product_details/screen_product_details.dart';

class ScreenOrderDetails extends StatelessWidget {
  const ScreenOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'Order Details'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                  child: Stepper(
                    type: StepperType.horizontal,
                    steps: getSteps(),
                  ),
                ),
                boldTextStyle(14, kDarkColor, 'Product(10)')!,
                kheight10,
                SizedBox(
                  height: height * 0.3,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => kheight20,
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      height: height * 0.1,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: kSilver),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: ClipRect(
                          child: Image.network(
                              'https://freepngimg.com/thumb/shoes/28090-6-sneaker-file.png'),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            boldTextStyle(
                                height * 0.015, kDarkColor, 'Product Name')!,
                            Row(
                              children: const [
                                //Button(icon: Icons.favorite_border),
                              ],
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            SizedBox(width: width * 0.05),
                            boldTextStyle(14, kBlueColor, '₹7500')!
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                kheight10,
                boldTextStyle(14, kDarkColor, 'Shipping Details')!,
                kheight10,
                Container(
                  height: height * 0.22,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomTile(
                          title: 'Date of Shipping',
                          trailing: '16 December 2022'),
                      CustomTile(
                          title: 'No. Resign', trailing: '2 Items Purchased'),
                      CustomTile(
                          title: 'Address',
                          trailing: '2727 Lakeshore Road\nTennesse, 78410')
                    ],
                  ),
                ),
                kheight10,
                boldTextStyle(14, kDarkColor, 'Payment Details')!,
                kheight10,
                Container(
                  height: height * 0.25,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomTile(title: 'Items(10)', trailing: '₹7500'),
                      CustomTile(title: 'Shipping', trailing: '₹40'),
                      CustomTile(title: 'Import Charges', trailing: '₹110'),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:
                            Headings(title: 'Total Prices', navtitle: '₹7650'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          title: regularTextStyle(8, ksilverOriginal, 'Packing')!,
          content: Container(),
        ),
        Step(
          title: regularTextStyle(8, ksilverOriginal, 'Shipping')!,
          content: Container(),
        ),
        Step(
          title: regularTextStyle(8, ksilverOriginal, 'Arriving')!,
          content: Container(),
        ),
        Step(
          title: regularTextStyle(8, ksilverOriginal, 'Delivered')!,
          content: Container(),
        )
      ];
}
