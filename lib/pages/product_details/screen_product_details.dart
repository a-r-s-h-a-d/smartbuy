import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/product_details/widgets/bottom_sheet_button.dart';
import 'package:smartbuy/pages/widgets/carousel.dart';
import 'package:smartbuy/pages/review/screen_review.dart';
import 'package:smartbuy/pages/review/widgets/review_model.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenProductDetails extends StatefulWidget {
  final String productname;
  final String price;
  final List<dynamic> size;
  final String description;
  final List<dynamic> productimages;
  const ScreenProductDetails({
    required this.productname,
    required this.price,
    super.key,
    required this.size,
    required this.description,
    required this.productimages,
  });

  @override
  State<ScreenProductDetails> createState() => _ScreenProductDetailsState();
}

class _ScreenProductDetailsState extends State<ScreenProductDetails> {
  int selectedIndex = 0;
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
          title: boldTextStyle(15, kDarkColor, widget.productname),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //carousel
              //
              SizedBox(
                height: height * 0.35,
                width: double.infinity,
                child: Carousel(imgList: widget.productimages),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.71,
                          child: Text(
                            widget.productname,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Poppins bold',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                          iconSize: 30,
                        ),
                      ],
                    ),
                    kheight10,
                    // RatingBar.builder(
                    //   itemBuilder: (context, _) => const Icon(
                    //     Icons.star,
                    //     size: 5,
                    //     color: Colors.yellow,
                    //   ),
                    //   onRatingUpdate: (rating) {},
                    // ),
                    boldTextStyle(16, kBlueColor, '₹ ${widget.price}')!,
                    kheight20,
                    boldTextStyle(14, kDarkColor, 'Select Size')!,
                    kheight20,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        widget.size.length,
                        (index) {
                          return sizeButton(index);
                        },
                      ),
                    ),
                    kheight50,
                    boldTextStyle(15, kDarkColor, 'Product Description')!,
                    kheight20,
                    regularTextStyle(12, kBlackColor, widget.description, 8)!,

                    //Display Reviews

                    kheight50,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        boldTextStyle(15, kDarkColor, 'Review Product')!,
                        GestureDetector(
                          onTap: () => Get.to(() => const ScreenReview()),
                          child: boldTextStyle(14, kBlueColor, 'See More')!,
                        ),
                      ],
                    ),
                    kheight30,
                    const ReviewModel(itemCount: 1),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomSheetButton(
              height: height,
              width: width * 0.4,
              buttoncolor: kWhiteColor,
              labelcolor: kBlueColor,
              label: 'Wishlist',
            ),
            kwidth20,
            BottomSheetButton(
              height: height,
              width: width * 0.4,
              buttoncolor: kBlueColor,
              labelcolor: kWhiteColor,
              label: 'Add to Cart',
              productname: widget.productname,
              productimage: widget.productimages[0],
              price: widget.price,
              size: widget.size[selectedIndex],
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: selectedIndex == index ? kBlackColor : kWhiteColor,
          borderRadius: kBradius15,
          border: Border.all(
            color: ksilverOriginal,
            width: 1.0,
          ),
        ),
        child: Center(
          child: regularTextStyle(
            10,
            selectedIndex == index ? kWhiteColor : kBlackColor,
            widget.size[index],
            1,
          ),
        ),
      ),
    );
  }
}
