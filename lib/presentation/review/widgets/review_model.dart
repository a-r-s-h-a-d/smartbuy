import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';
import 'package:smartbuy/core/constants.dart';

class ReviewModel extends StatelessWidget {
  final int itemCount;
  const ReviewModel({
    required this.itemCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // shrinkWrap: true,
      // physics: const ScrollPhysics(),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 40,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: NetworkImage(
                    'https://mobimg.b-cdn.net/v3/fetch/88/88c8abfc679f9ab594fd2647fb4fa1b8.jpeg'),
              ),
            ),
            title: boldTextStyle(14, kDarkColor, 'James Lawson'),
            subtitle: Row(
              children: const [
                Icon(Icons.star, color: Color(0xFFFFD700)),
                Icon(Icons.star, color: Color(0xFFFFD700)),
                Icon(Icons.star, color: Color(0xFFFFD700)),
                Icon(Icons.star, color: Color(0xFFFFD700)),
                Icon(Icons.star, color: Color(0xFFFFD700)),
              ],
            ),
          ),
          regularTextStyle(
            12,
            ksilverOriginal,
            'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
          )!,
        ],
      ),
      separatorBuilder: (context, index) => kheight20,
      itemCount: itemCount,
    );
  }
}
