import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/review/widgets/review_filter.dart';
import 'package:smartbuy/presentation/review/widgets/review_model.dart';

class ScreenReview extends StatelessWidget {
  const ScreenReview({super.key});
  final bool isFabVisible = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
        child: ListView(
          // shrinkWrap: true,
          // physics: const ScrollPhysics(),
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView(
                    // shrinkWrap: true,
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
    );
  }
}
