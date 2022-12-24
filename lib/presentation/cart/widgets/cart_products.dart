import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smartbuy/controllers/cart_controller.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/cart/widgets/texticonbutton.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    Key? key,
    required this.height,
    required this.width,
    required this.cart,
  }) : super(key: key);

  final double height;
  final double width;
  final CartController cart;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      separatorBuilder: (context, index) => kheight20,
      itemCount: 10,
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.15,
                color: ksilverOriginal,
              ),
              borderRadius: kBradius10,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          color: kWhiteColor,
                        ),
                        height: height * 0.065,
                        width: width * 0.25,
                        child: ClipRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://freepngimg.com/thumb/shoes/28090-6-sneaker-file.png",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      kwidth20,
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Product ${index + 1}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Row(
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
                        child: IconButton(
                          onPressed: () {
                            cart.productDecrement();
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                      GetBuilder<CartController>(
                        builder: (_) => boldTextStyle(
                            16, kDarkColor, cart.count.toString())!,
                      ),
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
                        child: IconButton(
                          onPressed: () {
                            cart.productIncrement();
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      const Spacer(),
                      GetBuilder<CartController>(
                        builder: (_) =>
                            boldTextStyle(14, kDarkColor, '₹${cart.price}')!,
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      TextIconButton(
                        icon: Icons.archive_outlined,
                        label: 'Save for later',
                      ),
                      TextIconButton(
                        icon: Icons.delete,
                        label: 'Remove',
                      ),
                      TextIconButton(
                        icon: Icons.flash_on,
                        label: 'Buy this now',
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
