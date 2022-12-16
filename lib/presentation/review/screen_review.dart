import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/review/screen_review_write.dart';
import 'package:smartbuy/presentation/review/widgets/review_model.dart';

class ScreenReview extends StatelessWidget {
  const ScreenReview({super.key});
  final bool isFabVisible = true;
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
            title: boldTextStyle(15, kDarkColor, 'Reviews'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: double.maxFinite,
            width: double.infinity,
            child: ListView(
              //scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const ReviewFilter(text: 'All Reviews'),
                          kwidth20,
                          const ReviewFilter(text: '5'),
                          kwidth20,
                          const ReviewFilter(text: '4'),
                          kwidth20,
                          const ReviewFilter(text: '3'),
                          kwidth20,
                          const ReviewFilter(text: '2'),
                          kwidth20,
                          const ReviewFilter(text: '1'),
                          kwidth20,
                        ],
                      ),
                    ),
                    kheight50,
                    SizedBox(
                      height: height * 0.7,
                      child: const ReviewModel(itemCount: 5),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: height * 0.07,
            width: width * 0.9,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const ScreeWriteReview());
              },
              child: boldTextStyle(13, kWhiteColor, 'Write Review'),
            ),
          ),
        ));
  }
}

class ReviewFilter extends StatelessWidget {
  final String text;
  const ReviewFilter({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: const Icon(
          Icons.star,
          color: Color(0xFFFFD700),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kSilver,
          disabledBackgroundColor: kWhiteColor,
        ),
        onPressed: () {},
        label: regularTextStyle(12, kDarkColor, text)!);
  }
}
