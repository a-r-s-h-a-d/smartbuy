import 'package:flutter/material.dart';
import 'package:smartbuy/pages/account/screen_account.dart';
import 'package:smartbuy/pages/cart/screen_cart.dart';
import 'package:smartbuy/pages/explore/screen_explore.dart';
import 'package:smartbuy/pages/home/screen_home.dart';
import 'package:smartbuy/pages/tabs/main_page/widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenExplore(),
    const ScreenCart(),
    // const ScreenOffer(),
    const ScreenAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
