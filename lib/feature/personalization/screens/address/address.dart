

import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/feature/personalization/screens/address/widget/single_address.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'add_new_addresses.dart';
class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: OAppColor.primary,
        child: Icon(Iconsax.add),
        onPressed: ()=>Get.to(()=> AddNewAddressScreen(),)),
      appBar: OAppBar(
        showBackArrow: true,
        title: Text("Address",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: true,),
              SingleAddress(selectedAddress: false,),
              SingleAddress(selectedAddress: true,),
              SingleAddress(selectedAddress: false,),
              SingleAddress(selectedAddress: true,),
              SingleAddress(selectedAddress: false,),
              SingleAddress(selectedAddress: true,),
              SingleAddress(selectedAddress: false,),
              SingleAddress(selectedAddress: true,),
              SingleAddress(selectedAddress: false,),
              SingleAddress(selectedAddress: true,),
              SingleAddress(selectedAddress: false,),

            ],
          ),

        ),
      )
    );
  }
}
