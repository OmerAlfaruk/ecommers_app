import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/circular_icon/circular_icon.dart';
import 'package:ecommerce/common/widget/images/rounded_image.dart';
import 'package:ecommerce/common/widget/product/product/brand_title_with_verified_icon.dart';
import 'package:ecommerce/common/widget/product/product/product_price_text.dart';
import 'package:ecommerce/feature/shop/screens/cart/widget/cart_items.dart';
import 'package:ecommerce/feature/shop/screens/checkout/checkout.dart';
import 'package:ecommerce/feature/shop/screens/home/widgets/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/product/cart/add_and_remove.dart';
import '../../../../common/widget/product/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(OSizes.defaultSpace),
        /// cart Items
        child: OCartItems(),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(OSizes.defaultSpace),
        child: ElevatedButton(onPressed: () { Get.to(()=>const CheckoutScreen()); }, child: Text('Checkout \$256.0'),),
      ),
    );
  }
}






