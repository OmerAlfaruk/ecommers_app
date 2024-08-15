import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/feature/personalization/controllers/user_controller.dart';
import 'package:ecommerce/feature/personalization/screens/profile/profile_Screen.dart';
import 'package:ecommerce/utils/connection/connectivity_manager.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController{
  static ChangeNameController get instance=>Get.find();
  final userRepository = Get.put(UserRepository());
  final userController = Get.put(UserController());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  Future<void> updateUserName() async {
    try {
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        return;
      }
      if(!updateUserNameFormKey.currentState!.validate()){
        return;
      }
      Map<String,dynamic> name={'FirstName':firstName.text.trim(),'LastName':lastName.text.trim(),};
      await userRepository.updateSingleField(name);
      userController.user.value.firstName=firstName.text.trim();
      userController.user.value.lastName=lastName.text.trim();

      Loader.successSnackBar(title: 'Congratulation',message: 'your name has been updated');
      Get.offAll(()=>ProfileScreen());

    } catch (e) {
      Loader.warningSnackBar(
          title: 'Oh Snap',
          message:e.toString()
         );
    }
  }
}