import 'package:ecommerce/feature/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerce/feature/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   final controller =Get.put(ForgetPasswordController());
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(OSizes.defaultSpace),
        child: Column(children: [
          ///Heading
          Text(OText.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: OSizes.defaultSpace,),
          Text(OText.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: OSizes.spaceBtwSections+2,),
          ///Text Field
          Form(
            key: controller.forgetPasswordKey,
            child: TextFormField(
              controller: controller.email,
              validator: OValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: OText.email,prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
          ),
          const SizedBox(height: OSizes.spaceBtwSections+2,),
          ///submit button
          SizedBox(width:double.infinity,child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail()
              , child:const Text("Submit") )),

        ],),
      ),
    );
  }
}
