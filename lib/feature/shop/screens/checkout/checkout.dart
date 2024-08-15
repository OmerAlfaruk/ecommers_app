import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/feature/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce/feature/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/feature/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widget/login_sign_up/success_screen.dart';
import '../../../../common/widget/product/cart/coupon_widget.dart';
import '../../../../navigation_menu.dart';
import '../cart/widget/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Scaffold(
      appBar: OAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            children: [
              /// --Items in cart
              const OCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),

              /// --- Coupon TextField
              CouponCode(),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),

              /// Billing Section
              RoundedContainer(
                padding: const EdgeInsets.all(OSizes.md),
                showBoarder: true,
                backgroundColor: dark ? OAppColor.black : OAppColor.white,
                child: Column(
                  children: [
                    /// Pricing
                    BillingAmountSection(),
                    SizedBox(
                      height: OSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: OSizes.spaceBtwItems,
                    ),

                    ///payment
                    BillingPaymentSection(),

                    /// Address
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(OSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => SuccessScreen(
                  image: OImages.successfulPaymentIcon,
                  title: 'Payment Success',
                  subTitle: 'Your Item will be shipped soon!',
                  onPressed: () => Get.offAll(() => NavigationBarMenu()),
                ));
          },
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
