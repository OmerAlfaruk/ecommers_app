import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/product/cart/cart_menu_icon.dart';
import 'package:ecommerce/feature/personalization/controllers/user_controller.dart';
import 'package:ecommerce/feature/shop/screens/cart/cart.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return OAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
             OText.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: OAppColor.white),
            ),
          Obx(
            () => Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: OAppColor.black),
            ),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {
            Get.to(() => CartScreen());
          },
          iconColor: Colors.white,
        )
      ],
    );
  }
}
