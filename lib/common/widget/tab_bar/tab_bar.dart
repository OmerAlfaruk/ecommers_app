import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
class OTabBar extends StatelessWidget implements PreferredSizeWidget{
  const OTabBar({super.key, required this.tabs});
final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark=OHelperFunctions.isDark(context);
    return  Material(
      color: dark? OAppColor.black:OAppColor.white,
      child: TabBar(tabs: tabs,
        isScrollable: true,
        indicatorColor: OAppColor.primary,
        labelColor: dark?Colors.white:OAppColor.primary,
        unselectedLabelColor: OAppColor.darkGrey,
        
      ),
    );
  }

  @override
 
  Size get preferredSize => Size.fromHeight(ODeviceUtils.getAppBarHeight());
}
