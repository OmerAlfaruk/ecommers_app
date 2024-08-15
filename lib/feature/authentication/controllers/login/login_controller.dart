import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/feature/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/connection/connectivity_manager.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// variables
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey();
  final userController=Get.put(UserController());

  @override
  void onInit() {
    // email.text = localStorage.read('REMEMBER_ME_EMAIL');
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form validation
      if (!loginFormKey.currentState!.validate()) {}
      // save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & password
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Remove Loading

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // show some generic error to the user
      Loader.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // start loading


      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
      //save User Record
      await userController.saveUserRecord(userCredentials);
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // show some generic error to the user
      Loader.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }
}
