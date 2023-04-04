// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbuy/services/functions/address/list_address.dart';
import 'package:smartbuy/services/functions/address/remove_address.dart';
import 'package:smartbuy/services/models/address/model_address.dart';
import 'package:smartbuy/services/controller/address_controller.dart';
import 'package:smartbuy/utils/colors.dart';
import 'package:smartbuy/utils/constants.dart';
import 'package:smartbuy/pages/add_address/add_address.dart';
import 'package:smartbuy/utils/styles.dart';

class ScreenAddress extends StatelessWidget {
  ScreenAddress({super.key});

  final AddressController controller = Get.put(AddressController());
  List<ModelAddress> addressList = [];

  @override
  Widget build(BuildContext context) {
    ModelAddress address;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                icon: const Icon(Icons.add),
                iconSize: 30,
                onPressed: () => Get.to(() => ScreenAddAddress()),
              ),
            ),
          ],
          title: boldTextStyle(15, kDarkColor, 'Address'),
        ),
      ),
      body: StreamBuilder(
        stream: readAddress(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: boldTextStyle(
                14,
                kDarkColor,
                'Something went wrong',
              ),
            );
          } else if (snapshot.hasData) {
            addressList = snapshot.data!;
            if (addressList.isEmpty) {
              return Center(
                child: boldTextStyle(
                  14,
                  kDarkColor,
                  'Add an Address',
                ),
              );
            } else {
              return ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: addressList.length,
                    itemBuilder: (context, index) {
                      address = addressList[index];
                      return BuildAddress(
                        address: address,
                        index: index,
                      );
                    },
                  ),
                ],
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // bottomSheet: StreamBuilder(
      //   stream: readAddress(),
      //   builder: (context, snapshot) {
      //     addressList = snapshot.data ?? [];
      //     if (addressList.isNotEmpty) {
      //       return Container(
      //         color: kBlueColor,
      //         height: height * 0.06,
      //         width: double.infinity,
      //         child: TextButton(
      //           onPressed: () {
      //             final addressindex = controller.groupValue;
      //             log(addressList[addressindex].fullname.toString());

      //             Navigator.pop(context, addressList[addressindex]);
      //           },
      //           child: regularTextStyle(12, kWhiteColor, 'Deliver Here', 1)!,
      //         ),
      //       );
      //     }
      //     return Container();
      //   },
      // ),
    );
  }
}

class BuildAddress extends StatelessWidget {
  final ModelAddress? address;
  final int index;
  const BuildAddress({
    super.key,
    required this.address,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight10,
        GetBuilder<AddressController>(
          builder: (controller) {
            return RadioListTile(
              title: boldTextStyle(15, kDarkColor, address!.fullname),
              subtitle: regularTextStyle(
                  13,
                  kDarkColor,
                  '${address!.housenoorbuildingname},${address!.roadareacolony},\n${address!.city},${address!.state}-${address!.pincode}\n${address!.phoneNumber}',
                  4),
              secondary: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: kBlueColor,
                    size: 25,
                  ),
                  onPressed: () {
                    removeaddress(address!.housenoorbuildingname);
                  },
                ),
              ),
              value: index,
              groupValue: controller.groupValue,
              onChanged: (value) {
                controller.setAddress(value);
                box.write('curaddress', controller.groupValue);
                controller.changeAddressonCheckout(address);
              },
            );
          },
        )
      ],
    );
  }
}
