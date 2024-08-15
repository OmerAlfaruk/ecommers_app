import 'package:ecommerce/feature/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../feature/personalization/screens/profile/profile_Screen.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';
class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return ListTile(
      leading: CircularImage(
        image: OImages.user,
        isNetworkImage: false,
        width: 50,
        height: 50,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: OAppColor.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: OAppColor.white),
      ),
      trailing: IconButton(onPressed: () {Get.to(()=>ProfileScreen());  }, icon: Icon(Iconsax.edit,color: OAppColor.white,),),
    );
  }
}

