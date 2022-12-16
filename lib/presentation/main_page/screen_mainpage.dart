import 'package:flutter/material.dart';
import 'package:smartbuy/presentation/account/screen_account.dart';
import 'package:smartbuy/presentation/cart/screen_cart.dart';
import 'package:smartbuy/presentation/explore/screen_explore.dart';
import 'package:smartbuy/presentation/home/screen_home.dart';
import 'package:smartbuy/presentation/main_page/widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
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
