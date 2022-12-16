import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/address/screen_address.dart';
import 'package:smartbuy/presentation/home/widgets/heading.dart';
import 'package:smartbuy/presentation/product_details/screen_product_details.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

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
          title: boldTextStyle(15, kDarkColor, 'Your Cart'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              height: height * 0.20,
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
                    SizedBox(
                        width: width * 0.32,
                        child: boldTextStyle(
                            height * 0.015, kDarkColor, 'Product Name')!),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Button(icon: Icons.favorite_border),
                        Button(icon: Icons.delete)
                      ],
                    )
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: kSilver,
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.remove),
                      ),
                      SizedBox(width: width * 0.05),
                      boldTextStyle(16, kDarkColor, '1')!,
                      SizedBox(width: width * 0.05),
                      Container(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: kSilver,
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.add),
                      ),
                      const Spacer(),
                      boldTextStyle(14, kDarkColor, '₹7500')!
                    ],
                  ),
                ),
              ),
            ),
            kheight50,
            Container(
              height: height * .25,
              decoration: BoxDecoration(
                border: Border.all(color: kSilver),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: const [
                  CustomTile(title: 'Items', trailing: '₹7500'),
                  CustomTile(title: 'Shipping', trailing: '₹40'),
                  CustomTile(title: 'Import Charges', trailing: '₹110'),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Headings(title: 'Total Prices', navtitle: '₹7650'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: height * 0.07,
          width: width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => const ScreenAddress(
                    screenname: 'Ship To',
                  ));
            },
            child: boldTextStyle(13, kWhiteColor, 'check out'),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;
  const Button({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 30,
            )),
      ],
    );
  }
}
