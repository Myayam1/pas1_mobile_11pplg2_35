import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_35/controllers/navigation_controller.dart';
import 'package:pas1_mobile_11pplg2_35/pages/menu_pages/account_page.dart';
import 'package:pas1_mobile_11pplg2_35/pages/menu_pages/favourite_page.dart';
import 'package:pas1_mobile_11pplg2_35/pages/menu_pages/home_page.dart';

class BottomNavContainer extends StatelessWidget {
  const BottomNavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();
    final List<Widget> pages = [HomePage(), FavouritePage(), AccountPage()];

    return Obx(() {
      return Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeMenu,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Account")
          ],
        ),
      );
    });
  }
}
