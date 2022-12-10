import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';
import 'package:smartbuy/presentation/profile/screen_profile.dart';
import 'package:smartbuy/presentation/widgets/customtextformfield.dart';

class Gender extends StatelessWidget {
  const Gender({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: boldTextStyle(15, kDarkColor, 'Edit Name'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08, vertical: 50),
        child: ListView(
          children: [
            boldTextStyle(14, kDarkColor, 'Gender')!,
            SizedBox(height: height * 0.01),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: DropdownButton<String>(
                items: <String>['Male', 'Female', 'Others'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            kheight50,
            SizedBox(
              height: height * 0.07,
              width: width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ScreenProfile(),
                  ));
                },
                child: boldTextStyle(13, kWhiteColor, 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
