
import 'package:ecommerce/feature/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: OAppColor.grey,),
            borderRadius: BorderRadius.circular(100),),
          child: IconButton(icon: const Image(width: OSizes.md,
            height: OSizes.iconMd, image: AssetImage(OImages.google),
          ), onPressed: () => controller.googleSignIn(),),
        ),
        const SizedBox(
          width: OSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: OAppColor.grey,),
            borderRadius: BorderRadius.circular(100),),
          child: IconButton(icon: const Image(width: OSizes.md,
            height: OSizes.iconMd, image: AssetImage(OImages.facebook),
          ), onPressed: (){},),
        ),
      ],
    );
  }
}