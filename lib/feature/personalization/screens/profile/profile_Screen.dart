import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/images/circular_image.dart';
import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/feature/personalization/controllers/user_controller.dart';
import 'package:ecommerce/feature/personalization/screens/profile/widget/edit_name.dart';
import 'package:ecommerce/feature/personalization/screens/profile/widget/profile_menu.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    final controller=UserController.instance;
    return Scaffold(
      appBar: const OAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            children: [
              ///--- Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                    (){
                      final networkImage=controller.user.value.profilePicture;
                      final image=networkImage.isNotEmpty?networkImage:OImages.user;
                      return controller.imageUploader.value?CircularProgressIndicator(): CircularImage(
                        height: 100,
                        width: 100,fit: BoxFit.cover,
                        image:image,
                        isNetworkImage: networkImage.isNotEmpty?true:false,
                        backgroundColor: Colors.transparent,
                      );}
                    ),
                    TextButton(
                        onPressed: () {
                          controller.uploadUserProfilePicture();
                        },
                        child: Text("Change Profile Picture")),
                  ],
                ),
              ),
              SizedBox(
                height: OSizes.spaceBtwItems / 2,
              ),
              Divider(),
              SizedBox(
                height: OSizes.spaceBtwItems,
              ),
              SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              SizedBox(
                height: OSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: "Name",
                value: controller.user.value.fullName,
                onPressed: () {
                  Get.to(()=>EditNameScreen());

                },
                icon: Iconsax.arrow_right,
              ),
              ProfileMenu(
                title: 'Username',
                value: controller.user.value.userName,
                onPressed: () {},
                icon: Iconsax.arrow_right,
              ),
              SizedBox(
                height: OSizes.spaceBtwItems,
              ),

              Divider(),
              SizedBox(
                height: OSizes.spaceBtwItems,
              ),
              const SectionHeading(title: 'Personal Information'),
              SizedBox(
                height: OSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'User Id',
                value: controller.user.value.id,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
                icon: Iconsax.arrow_right,
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
                icon: Iconsax.arrow_right,
              ),
              ProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
                icon: Iconsax.arrow_right,
              ),
              ProfileMenu(
                title: 'Date of Birth',
                value: '10 oct,1985',
                onPressed: () {},
                icon: Iconsax.arrow_right,
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                    controller.deleteAccountWarningPopup();
                  },
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
