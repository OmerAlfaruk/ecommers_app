import 'package:ecommerce/feature/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerce/feature/authentication/screens/login/login_screen.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  final String email;
  const ResetPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.offAll(const LoginScreen()), icon: const Icon(CupertinoIcons.clear),),
        ],),
      body: Padding(
        padding: const EdgeInsets.all(OSizes.defaultSpace),
        child:  Column(
          children: [
            /// Image
            Image(
              image: const AssetImage(OImages.deliveredInPlaneIllustration),
              width: OHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(
              height: OSizes.spaceBtwSections,
            ),
            Text(
             email,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: OSizes.spaceBtwItems,
            ),

            /// Title And Subtitles
            Text(
              OText.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: OSizes.spaceBtwItems,
            ),
            Text(
              OText.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: OSizes.spaceBtwSections,
            ),

            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>Get.offAll(const LoginScreen()),
                child: const Text('Done'),
              ),
            ),
            const SizedBox(height: OSizes.spaceBtwItems,),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: ()=>ForgetPasswordController.instance.resendPasswordResetEmail(email),
                child: const Text('Resend Email'
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
