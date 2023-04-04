// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:smartbuy/utils/colors.dart';
// import 'package:smartbuy/pages/account/widgets/account_tile.dart';
// import 'package:smartbuy/pages/notifications/screen_feed_activity.dart';
// import 'package:smartbuy/utils/styles.dart';

// class ScreenNotification extends StatelessWidget {
//   const ScreenNotification({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(height * 0.15),
//         child: AppBar(
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: kDarkColor,
//             ),
//             onPressed: () {
//               Get.back();
//             },
//           ),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: boldTextStyle(15, kDarkColor, 'Notifications'),
//         ),
//       ),
//       body: Column(
//         children: const [
//           // AccountTile(
//           //   icon: Icons.local_offer_outlined,
//           //   title: 'Offer',
//           //   route: ScreenFeedActivity(screename: 'Offer'),
//           // ),
//           AccountTile(
//             icon: Icons.feed_outlined,
//             title: 'Feed',
//             route: ScreenFeedActivity(
//               screename: 'Feed',
//             ),
//           ),
//           AccountTile(
//             icon: Icons.notifications_active,
//             title: 'Activity',
//             route: ScreenFeedActivity(screename: 'Activity'),
//           ),
//         ],
//       ),
//     );
//   }
// }
