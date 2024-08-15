import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/feature/authentication/models/user_model.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/feature/authentication/screens/sign_up/verify_email_screen.dart';
import 'package:ecommerce/utils/connection/connectivity_manager.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController(); // controller for email input
  final lastName = TextEditingController(); // controller for lastName input
  final userName = TextEditingController(); // controller for userName input
  final password = TextEditingController(); // controller for password input
  final firstName = TextEditingController(); // controller for firstName input
  final phoneNumber =
      TextEditingController(); // controller for phoneNumber input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SIGNUP
  Future<void> signup() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          'We are processing your information ....', OImages.sandTimer);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form validation
      if (!signupFormKey.currentState!.validate()) return;
      // Privacy Policy check
      if (!privacyPolicy.value) {
        Loader.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In order To create account you have to read and accept privacy policy and terms of use");
        return;
      }

      // Register  user in firebase authentication and save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');
      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      // Loader Remove
      FullScreenLoader.stopLoading();
      // show success message
      Loader.successSnackBar(
          title: 'congratulation',
          message: 'Your account has been created verify email to continue');

      // move to verify email Screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.stopLoading();
      // show some generic error to the user
      Loader.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }
}
