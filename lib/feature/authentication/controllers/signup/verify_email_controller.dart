import 'dart:async';

import 'package:ecommerce/common/widget/login_sign_up/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever Verify Screen appears & set Timer For auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///send email Verification link
 Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loader.successSnackBar(
          title: 'Email Sent!',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      Loader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  ///Timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: OImages.successfullyRegisterAnimation,
            title: OText.yourAccountCreatedTitle,
            subTitle: OText.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  ///Manually check if Email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: OImages.successfullyRegisterAnimation,
          title: OText.yourAccountCreatedTitle,
          subTitle: OText.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
