

import 'package:ecommerce/common/styles/spacing_styles.dart';
import 'package:ecommerce/feature/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateForm extends StatelessWidget {
  const ReAuthenticateForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(title: Text("Enter Your Email And Password"),),
      body: Padding(
        padding: OSpacingStyle.paddingWithAppBarHeight,
        child: Form(
            key: controller.reAuthFormKey,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: OSizes.spaceBtwSections),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: (value) => OValidator.validateEmail(value),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Iconsax.message),
                      ),
                    ),
                    SizedBox(
                      height: OSizes.spaceBtwInputFields,
                    ),
                    Obx(
                          () => TextFormField(
                        controller: controller.verifyPassword,
                        obscureText: controller.hidePassword.value,
                        validator: (value) =>
                            OValidator.validateEmptyText('Password', value),
                        decoration: InputDecoration(
                            labelText: OText.password,
                            prefixIcon: Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.hidePassword.value =
                                  !controller.hidePassword.value;
                                },
                                icon: Icon(controller.hidePassword.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye))),
                      ),
                    ),
                    const SizedBox(
                      height: OSizes.spaceBtwInputFields / 2,
                    ),


                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed :(){
                         controller.reAuthenticateEmailAndPassword();
                        },
                        child: const Text("Submit"),
                      ),
                    )

                  ],
                ),),),
      ),
    );
  }
}
