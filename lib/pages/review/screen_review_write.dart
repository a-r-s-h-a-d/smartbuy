import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreeWriteReview extends StatelessWidget {
  const ScreeWriteReview({super.key});

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
          title: boldTextStyle(15, kDarkColor, 'Write Review'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            boldTextStyle(13, kDarkColor,
                'Please write overall level of satisfaction with your Shipping/Delivery Service')!,
            kheight20,
            RatingBar.builder(
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              onRatingUpdate: (rating) {},
            ),
            kheight50,
            boldTextStyle(13, kDarkColor, 'Write your review')!,
            kheight30,
            TextField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Write your review here',
                border: OutlineInputBorder(
                  borderRadius: kBradius10,
                ),
              ),
            ),
            kheight50,
            boldTextStyle(12, kDarkColor, 'Add Photo')!,
            kheight20,
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: kWhiteColor,
                      border: Border.all()),
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
              ],
            )
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
              Get.back();
            },
            child: boldTextStyle(13, kWhiteColor, 'Save'),
          ),
        ),
      ),
    );
  }
}
