import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/services/controller/wishlist_controller.dart';
import 'package:smartbuy/services/models/products/model_product.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/product_details/widgets/bottom_sheet_button.dart';
import 'package:smartbuy/pages/widgets/carousel.dart';
import 'package:smartbuy/pages/review/screen_review.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenProductDetails extends StatefulWidget {
  final Products product;
  const ScreenProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ScreenProductDetails> createState() => _ScreenProductDetailsState();
}

class _ScreenProductDetailsState extends State<ScreenProductDetails> {
  final controller = Get.put(WishlistController());

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: boldTextStyle(15, kDarkColor, widget.product.productname),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //carousel
              SizedBox(
                height: height * 0.35,
                width: double.infinity,
                child: Carousel(imgList: widget.product.productimages),
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
                            widget.product.productname,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Poppins bold',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        StreamBuilder(
                          stream: controller.readWishlist(),
                          builder: (context, snapshot) {
                            final wishlist = snapshot.data;
                            return IconButton(
                              iconSize: 30,
                              onPressed: () {
                                if (wishlist?.any((element) =>
                                        element.productname ==
                                        widget.product.productname) ??
                                    false) {
                                  controller.removefromWishlist(widget.product);
                                } else {
                                  controller.addtoWishlist(widget.product);
                                }
                              },
                              icon: wishlist?.any((element) =>
                                          element.productname ==
                                          widget.product.productname) ==
                                      true
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border),
                            );
                          },
                        )
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
                    // boldTextStyle(16, kBlueColor, '₹ ${widget.price}')!,
                    currency(16, kBlueColor, int.parse(widget.product.price))!,
                    kheight10,
                    boldTextStyle(14, kDarkColor, 'Available Size')!,
                    kheight10,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        widget.product.size.length,
                        (index) {
                          return sizeButton(index);
                        },
                      ),
                    ),
                    kheight20,
                    boldTextStyle(15, kDarkColor, 'Product Description')!,
                    kheight10,
                    regularTextStyle(
                        12, kBlackColor, widget.product.description, 8)!,

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
                    // const ReviewModel(itemCount: 1),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      bottomSheet: BottomSheetButton(
        height: height,
        width: double.infinity,
        buttoncolor: kBlueColor,
        labelcolor: kWhiteColor,
        label: 'Add to Cart',
        productname: widget.product.productname,
        productimage: widget.product.productimages[0],
        price: widget.product.price,
        size: widget.product.size[selectedIndex],
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
            widget.product.size[index],
            1,
          ),
        ),
      ),
    );
  }
}
