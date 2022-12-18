import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/add_address/add_address.dart';
import 'package:smartbuy/presentation/payment/screen_payment.dart';

class ScreenAddress extends StatelessWidget {
  final String screenname;
  const ScreenAddress({
    required this.screenname,
    super.key,
  });

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
          actions: [
            screenname == 'Ship To'
                ? IconButton(
                    onPressed: () {
                      Get.to(() => const ScreenAddAddress());
                    },
                    icon: const Icon(Icons.add))
                : const SizedBox(),
          ],
          title: boldTextStyle(15, kDarkColor, screenname),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: height * 0.25,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        boldTextStyle(14, kDarkColor, 'Name')!,
                        regularTextStyle(
                            12, const Color(0xFF08415C), 'Address')!,
                        regularTextStyle(
                            12, const Color(0xFF08415C), 'mobile')!,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.3,
                              child: TextButton(
                                onPressed: () {},
                                child: boldTextStyle(13, kBlueColor, 'Edit')!,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.3,
                              child: TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                    radius: 10.0,
                                    contentPadding: const EdgeInsets.all(20.0),
                                    title: 'Remove',
                                    middleText:
                                        'Are you sure , You want to remove!',
                                    textConfirm: 'Okay',
                                    confirm: OutlinedButton.icon(
                                      onPressed: () => Get.back(),
                                      icon: const Icon(
                                        Icons.check,
                                        color: Colors.blue,
                                      ),
                                      label: const Text(
                                        'Okay',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    cancel: OutlinedButton.icon(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(Icons.close),
                                      label: const Text('No'),
                                    ),
                                  );
                                },
                                child: boldTextStyle(
                                    13, const Color(0xFFEE4B2B), 'Remove')!,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => kheight10,
          itemCount: 2),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: height * 0.07,
          width: width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              screenname == 'Address'
                  ? Get.to(() => const ScreenAddAddress())
                  : Get.to(() => const ScreenPayment());
            },
            child: boldTextStyle(
              13,
              kWhiteColor,
              screenname == 'Ship To' ? 'Next' : 'Add Address',
            ),
          ),
        ),
      ),
    );
  }
}
