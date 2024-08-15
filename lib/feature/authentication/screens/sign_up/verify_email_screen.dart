
import 'package:ecommerce/common/widget/login_sign_up/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/feature/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecommerce/feature/authentication/screens/login/login_screen.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String? email;
  const VerifyEmailScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final  controller=Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            child: const Icon(CupertinoIcons.clear),
            onTap: () => AuthenticationRepository.instance.logout(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(OImages.deliveredEmailIllustration),
                width: OHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),

              /// Title And Subtitles
              Text(
                OText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),
              Text(
                email??'',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),
              Text(
                OText.confirmEmailSubTitle,
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
                  onPressed: () {
                  controller.checkEmailVerificationStatus();
                  },
                  child: const Text("continue"),
                ),
              ),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()=>controller.sendEmailVerification(),
                  child: const Text(OText.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
