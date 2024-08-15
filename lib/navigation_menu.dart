import 'package:ecommerce/feature/shop/screens/home/home.dart';
import 'package:ecommerce/feature/shop/screens/store/store.dart';
import 'package:ecommerce/feature/shop/screens/wish_list/wish_list.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'feature/personalization/screens/settings/settings.dart';

class NavigationBarMenu extends StatelessWidget {
  const NavigationBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
  final  darkMode=OHelperFunctions.isDark(context);
    final controller=Get.put(NavigationController());
    return  Scaffold(
        bottomNavigationBar:Obx(()=>
          NavigationBar(

            height:80,
            elevation: 0,
            backgroundColor:darkMode?Colors.black:Colors.white ,
            indicatorColor: darkMode?Colors.white.withOpacity(0.1):Colors.black.withOpacity(0.1),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index)=>controller.selectedIndex.value=index,
            destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],),
        ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),

    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex=0.obs;
  final screens =[
    const HomePage(),const StoreScreen(),const WishList(),const SettingScreen()
  ];
}
