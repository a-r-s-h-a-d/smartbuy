import 'package:flutter/material.dart';
import 'package:smartbuy/core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: newIndex,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          selectedItemColor: kBlueColor,
          unselectedItemColor: kSilver,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.local_offer_outlined), label: 'Offer'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded), label: 'Account'),
          ],
        );
      },
    );
  }
}
