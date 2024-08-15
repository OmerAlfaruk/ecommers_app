import 'package:ecommerce/common/styles/spacing_styles.dart';
import 'package:ecommerce/feature/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/feature/personalization/controllers/change_name_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final controller = Get.put(ChangeNameController());
      return Scaffold(
        appBar: AppBar(title: Text("Edit Name"),),
       body: Padding(
          padding: OSpacingStyle.paddingWithAppBarHeight,
          child: Form(
              key: controller.updateUserNameFormKey,
              child: Padding(
              padding: const EdgeInsets.symmetric(vertical: OSizes.spaceBtwSections),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextFormField(
          controller: controller.firstName,
          validator: (value) => OValidator.validateEmptyText('First Name', value),
          decoration: const InputDecoration(
           labelText: 'First Name',
            prefixIcon: Icon(Iconsax.user),
          ),
          ),
          SizedBox(
          height: OSizes.spaceBtwInputFields,
          ),
              TextFormField(
                controller: controller.lastName,
              validator: (value) => OValidator.validateEmptyText('First Name', value),
              decoration: const InputDecoration(
                labelText: 'Last Name',
                prefixIcon: Icon(Iconsax.user),
              ),),
          const SizedBox(
          height: OSizes.spaceBtwInputFields / 2,
          ),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.updateUserName();
                },
                child: const Text("Save"),
              ),
            )

          ],
          ))),
        ),
      );
  }
}
