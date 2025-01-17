import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/feature/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce/utils/connection/connectivity_manager.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{

  static ForgetPasswordController get instance => Get.find();
  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey=GlobalKey<FormState>();

  /// send Reset Password email
 sendPasswordResetEmail()async{
   try{
     // start Loading

     // check internet connectivity
     final isConnected = await NetworkManager.instance.isConnected();
     if (!isConnected) return;

     // Form validation
     if (!forgetPasswordKey.currentState!.validate()) {}
     // send email reset password
     await AuthenticationRepository.instance.sendPasswordReset(email.text.trim());
     
     // show success Screen
     Loader.successSnackBar(title: 'Email Sent',message: 'Email links sent to reset your Password '.tr);
     Get.to(()=>ResetPassword(email: email.text.trim(),));

   }
   catch(e){
     Loader.errorSnackBar(title: 'ooh snap',message: e.toString());

   }
 }
 resendPasswordResetEmail(String email)async{
   try{
     // start Loading

     // check internet connectivity
     final isConnected = await NetworkManager.instance.isConnected();
     if (!isConnected) return;

     // send email reset password
     await AuthenticationRepository.instance.sendPasswordReset(email);

     // show success Screen
     Loader.successSnackBar(title: 'Email Sent',message: 'Email links sent to reset your Password '.tr);

   }
   catch(e){
     Loader.errorSnackBar(title: 'ooh snap',message: e.toString());

   }
 }


}