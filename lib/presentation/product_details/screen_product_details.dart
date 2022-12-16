import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/home/widgets/carousel.dart';
import 'package:smartbuy/presentation/main_page/widgets/bottom_nav.dart';
import 'package:smartbuy/presentation/review/screen_review.dart';
import 'package:smartbuy/presentation/review/widgets/review_model.dart';

class ScreenProductDetails extends StatelessWidget {
  final String productname;
  final String price;
  ScreenProductDetails({
    required this.productname,
    required this.price,
    super.key,
  });

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZSUyMGRpc2NvdW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YWRpZGFzJTIwc2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/flagged/photo-1556637640-2c80d3201be8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YWRpZGFzJTIwc2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGFkaWRhcyUyMHNob2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];
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
          title: boldTextStyle(15, kDarkColor, productname),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.4,
                width: double.infinity,
                child: Carousel(imgList: imgList),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        boldTextStyle(20, kDarkColor, productname)!,
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                          iconSize: 30,
                        ),
                      ],
                    ),
                    kheight10,
                    RatingBar.builder(
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    kheight10,
                    boldTextStyle(16, kBlueColor, '₹ $price')!,
                    kheight20,
                    boldTextStyle(14, kDarkColor, 'Select Size')!,
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizeAndColor(size: '6'),
                        SizeAndColor(size: '7'),
                        SizeAndColor(size: '8'),
                        SizeAndColor(size: '9'),
                        SizeAndColor(size: '10'),
                      ],
                    ),
                    kheight20,
                    boldTextStyle(14, kDarkColor, 'Select Color')!,
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizeAndColor(
                          color: Colors.red,
                        ),
                        SizeAndColor(
                          color: Colors.black,
                        ),
                        SizeAndColor(
                          color: Colors.white,
                        ),
                      ],
                    ),
                    kheight20,
                    boldTextStyle(14, kDarkColor, 'Product Details')!,
                    //specification and type
                    const CustomTile(title: 'Color', trailing: 'Color'),
                    const CustomTile(
                        title: 'Inner Material', trailing: 'material'),
                    const CustomTile(
                        title: 'Outer Material', trailing: 'material'),
                    const CustomTile(title: 'Occasion', trailing: 'occassion'),
                    const CustomTile(title: 'Leather Type', trailing: 'type'),
                    const CustomTile(
                        title: 'Sole Material', trailing: 'material'),
                    const CustomTile(
                        title: 'Upper Pattern', trailing: 'pattern'),

                    //Display Reviews

                    ListTile(
                      leading: boldTextStyle(15, kDarkColor, 'Review Product'),
                      trailing: GestureDetector(
                        onTap: () => Get.to(() => const ScreenReview()),
                        child: boldTextStyle(14, kBlueColor, 'See More'),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.7,
                      child: const ReviewModel(itemCount: 3),
                    ),

                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          indexChangeNotifier.value = 2;
                        },
                        child: boldTextStyle(13, kWhiteColor, 'Add to Cart'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  final String trailing;

  const CustomTile({
    required this.title,
    required this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: regularTextStyle(12, ksilverOriginal, title),
      trailing: regularTextStyle(12, kBlackColor, trailing),
    );
  }
}

class SizeAndColor extends StatelessWidget {
  final String? size;
  final Color? color;
  const SizeAndColor({
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 21,
      backgroundColor: kBlackColor,
      child: CircleAvatar(
        foregroundColor: kBlackColor,
        backgroundColor: color == color ? color : Colors.transparent,
        child: size == null
            ? const Text('')
            : boldTextStyle(22, kDarkColor, size!),
      ),
    );
  }
}
