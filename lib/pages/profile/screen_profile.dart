// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:smartbuy/utils/colors.dart';
// import 'package:smartbuy/utils/constants.dart';
// import 'package:smartbuy/pages/account/widgets/account_tile.dart';
// import 'package:smartbuy/pages/profile/widgets/custom_editprofile.dart';
// import 'package:smartbuy/pages/profile/widgets/gender.dart';
// import 'package:smartbuy/pages/widgets/custom_button.dart';
// import 'package:smartbuy/utils/images.dart';
// import 'package:smartbuy/utils/styles.dart';

// class ScreenProfile extends StatelessWidget {
//   ScreenProfile({super.key});

//   final ImagePicker pickedImage = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(height * 0.1),
//         child: AppBar(
//           iconTheme: const IconThemeData(color: Colors.black),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: boldTextStyle(15, kDarkColor, 'Profile'),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: ClipRRect(
//                         child: Image.asset(
//                       tempprofile,
//                       height: height * 0.15,
//                     )),
//                   ),
//                   Column(
//                     children: const [
//                       Button(icon: Icons.photo_library_sharp),
//                       Button(icon: Icons.delete),
//                     ],
//                   )
//                 ],
//               ),
//               kheight50,
//               AccountTile(
//                 icon: Icons.person_outline,
//                 title: 'Muhammed Arshad K A',
//                 route: CustomEditScreen(
//                   fieldname: 'Full Name',
//                   icon: Icons.person_outline,
//                   keyboardtype: TextInputType.name,
//                   fieldvalues: 'Muhammed Arshad',
//                 ),
//               ),
//               kheight10,
//               const AccountTile(
//                 icon: Icons.male_outlined,
//                 title: 'Male',
//                 route: Gender(),
//               ),
//               kheight10,
//               AccountTile(
//                 icon: Icons.calendar_month,
//                 title: '16-05-2000',
//                 route: CustomEditScreen(
//                   fieldname: 'Date of Birth',
//                   icon: Icons.calendar_month,
//                   keyboardtype: TextInputType.datetime,
//                   fieldvalues: '16-05-2000',
//                 ),
//               ),
//               kheight10,
//               AccountTile(
//                 icon: Icons.mail_outline,
//                 title: 'arshad@gmail.com',
//                 route: CustomEditScreen(
//                     fieldname: 'e-mail',
//                     icon: Icons.mail_outline,
//                     keyboardtype: TextInputType.emailAddress,
//                     fieldvalues: 'arshad@gmail.com'),
//               ),
//               kheight10,
//               AccountTile(
//                 icon: Icons.smartphone,
//                 title: '+91 9446854779',
//                 route: CustomEditScreen(
//                   fieldname: 'Phone Number',
//                   icon: Icons.smartphone,
//                   keyboardtype: TextInputType.phone,
//                   fieldvalues: "9446854779",
//                 ),
//               ),
//               kheight10,
//               AccountTile(
//                 icon: Icons.lock_outline,
//                 title: 'Change Password',
//                 route: CustomEditScreen(
//                   fieldname: 'Old Password',
//                   icon: Icons.lock_outline,
//                   keyboardtype: TextInputType.visiblePassword,
//                   fieldvalues: 'gdsgyad',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
