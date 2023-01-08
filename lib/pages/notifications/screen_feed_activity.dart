import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenFeedActivity extends StatelessWidget {
  final String screename;
  final String? image;
  final IconData? icon;
  const ScreenFeedActivity({
    super.key,
    this.image,
    this.icon,
    required this.screename,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kDarkColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, screename),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: height * 0.09,
                    height: height * 0.09,
                    decoration: BoxDecoration(
                      color: screename == 'Feed'
                          ? const Color.fromARGB(255, 25, 20, 45)
                          : kWhiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    child: ClipRect(
                      child: screename == 'Feed'
                          ? Image.network(
                              'https://freepngimg.com/thumb/shoes/112135-picture-converse-shoes-free-download-png-hq.png')
                          : const Icon(
                              Icons.double_arrow_outlined,
                              size: 30,
                              color: kBlueColor,
                            ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldTextStyle(
                          14,
                          kDarkColor,
                          screename == 'Feed'
                              ? 'New Product'
                              : 'Transaction Successful')!,
                      SizedBox(
                        width: width * 0.7,
                        child: Text(
                          screename == 'Feed'
                              ? "Nike Air Max Added -Checkout"
                              : 'Account no:xxxx xxxx xxxx',
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          separatorBuilder: (context, index) => kheight20,
          itemCount: 3,
        ),
      ),
    );
  }
}
