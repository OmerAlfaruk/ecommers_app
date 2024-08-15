import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerce/common/widget/images/circular_image.dart';
import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/feature/personalization/screens/address/address.dart';
import 'package:ecommerce/feature/shop/screens/order/order.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/List_tile/settings_menu_tile.dart';
import '../../../../common/widget/List_tile/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final authRepo= Get.put(AuthenticationRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  OAppBar(
                      title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: OAppColor.white),
                  )),
                  SizedBox(
                    height: OSizes.defaultSpace,
                  ),

                  /// User Profile card
                  UserProfileTile(),
                  SizedBox(
                    height: OSizes.defaultSpace,
                  ),
                ],
              ),
            ),

            /// --- body
            Padding(
              padding: EdgeInsets.all(OSizes.defaultSpace),
              child: Column(
                children: [
                  SectionHeading(
                    title: "Account Setting",
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: OSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My address',
                    subTitle: 'Set Shopping Delivery address',
                    onTap: ()=>Get.to(()=>const UserAddressScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and completed orders',
                    onTap: () =>Get.to(()=>const OrderScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List all discounted Coupons',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),
                  /// ---App Settings
                  SizedBox(
                    height: OSizes.spaceBtwSections,
                  ),
                  SectionHeading(title: "App Settings"),
                  SizedBox(height: OSizes.spaceBtwItems,),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to Your Cloud Firebase',

                    onTap: () {},
                  ),SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Load Data',
                    subTitle: 'Upload Data to Your Cloud Firebase',
                    trailing: Switch(value: false,onChanged: (value){},),
                    onTap: () {},
                  ),SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all age',
                    trailing: Switch(value: false,onChanged: (value){},),
                    onTap: () {},
                  ),SettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set Image Quality to be seen',
                    trailing: Switch(value: false,onChanged: (value){},),
                    onTap: () {},
                  ),

                  ElevatedButton(onPressed: ()=>authRepo.logout(), child: Text('Logout'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
