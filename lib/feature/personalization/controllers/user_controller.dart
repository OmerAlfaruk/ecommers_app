import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/feature/authentication/models/user_model.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/feature/authentication/screens/login/login_screen.dart';
import 'package:ecommerce/feature/authentication/screens/re_autheenticate/re_authenticate.dart';
import 'package:ecommerce/utils/connection/connectivity_manager.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;

  final profileLoading = false.obs;
  final imageUploader= false.obs;
  final userRepository = Get.put(UserRepository());
  final hidePassword=false.obs;
  final verifyEmail=TextEditingController();
  final verifyPassword=TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();



  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // refresh user Records
      await fetchUserRecord();
      if(user.value.id.isEmpty){if (userCredentials != null) {
        // convert name to first name and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final userName =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');
      }}
    } catch (e) {
      Loader.warningSnackBar(
          title: 'Data not saved',
          message:
              'something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  Future<void> updateUserData(UserCredential? userCredentials) async {
    try {} catch (e) {
      Loader.warningSnackBar(
          title: 'Data not saved',
          message:
              'something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }



  Future<void> removeUserRecord(UserCredential? userCredentials) async {
    try {} catch (e) {
      Loader.warningSnackBar(
          title: 'Data not saved',
          message:
              'something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }

  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding:const EdgeInsets.all(OSizes.md),
      title: 'Delete Account',
      middleText: ' Are you sure to delete your account permanently? This action iis not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed:() async => deleteUserAccount(),
      style:ElevatedButton.styleFrom(backgroundColor: Colors.red,side:const BorderSide(color: Colors.red)),
      child: const Padding(padding: EdgeInsets.symmetric(horizontal: OSizes.lg),child: Text('Delete'),),

      ),
    cancel:OutlinedButton(
   onPressed: ()=>Navigator.of(Get.overlayContext!).pop(),
    child: const Padding(padding: EdgeInsets.symmetric(horizontal: OSizes.lg),child: Text('cancel'),),
    )
    );
  }
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      // Show loading indicator
      // Show CircularProgressIndicator in the UI to indicate loading

      // Check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Show message to user about the lack of internet connectivity
        return;
      }

      // Validate form fields
      if (!reAuthFormKey.currentState!.validate()) {
        // Optionally, show error messages to the user for invalid fields
        return;
      }

      // Reauthenticate with email and password
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());

      // Delete account
      await AuthenticationRepository.instance.deleteAccount();

      // Navigate to LoginScreen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Handle any exceptions that occur
      Loader.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
  void deleteUserAccount()async {
try{
  /// First re-authenticate
  final auth =AuthenticationRepository.instance;
  final provider= auth.authUser!.providerData.map((e) => e.providerId).first;
  if(provider.isNotEmpty){
    //re verify email
    if(provider=='google.com'){
      await auth.signInWithGoogle();

      // Delete account
      await auth.deleteAccount();

      // Navigate to LoginScreen after successful deletion
      Get.offAll(() => const LoginScreen());
    }
    else if(provider=='password'){
      Get.to(const ReAuthenticateForm());
    }
  }
} catch(e){
  Loader.warningSnackBar(title: 'oh snap',message: e.toString());
}
  }
  Future<void> uploadUserProfilePicture() async {
    try {
final image=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
if(image!=null){
  imageUploader.value=true;
  // upload image
  final imageUrl=await userRepository.uploadImage('Users/Images/Profile/', image);
  //update user Image Record
  Map<String,dynamic> json={'ProfilePicture':imageUrl};
  await userRepository.updateSingleField(json);

  user.value.profilePicture=imageUrl;
  user.refresh();
  Loader.successSnackBar(title: "congratulation",message: "Your Profile Image has been updated ");
}
    } catch (e) {
      Loader.warningSnackBar(
          title: 'oh snap',
          message:
          'something went wrong :$e');
    }
    finally{
      imageUploader.value=false;
    }
  }
}
