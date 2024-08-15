import 'dart:io';

import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/feature/authentication/screens/login/login_screen.dart';
import 'package:ecommerce/feature/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:ecommerce/feature/authentication/screens/sign_up/verify_email_screen.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// show relevant Screen
  void screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationBarMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // local storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }
/*-----------------------Email Password sign-in---------------------------*/

  /// Email Authentication - signIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw OFirebaseAuthException(e.code).message;
      // Re-throwing the exception to handle it elsewhere if needed
    } on FormatException catch (e) {
      throw OFirebaseException(e.message);
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong please try again';
    }
  }

  /// Email Authentication - register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw OFirebaseAuthException(e.code).message;
      // Re-throwing the exception to handle it elsewhere if needed
    } on FormatException catch (e) {
      throw OFirebaseException(e.message);
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong please try again';
    }
  }

  /// ReAuthenticate - reAuthenticate User
  Future<UserCredential> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential=EmailAuthProvider.credential(email: email, password: password);
      return await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw OFirebaseAuthException(e.code).message;
      // Re-throwing the exception to handle it elsewhere if needed
    } on FormatException catch (e) {
      throw OFirebaseException(e.message);
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong please try again';
    }
  }
  /// EmailVerification -MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw OFirebaseAuthException(e.code).message;
      // Re-throwing the exception to handle it elsewhere if needed
    } on FormatException catch (e) {
      throw OFirebaseException(e.message);
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong please try again';
    }
  }

  /// EmailAuthentication - FORGET PASSWORD
  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw OFirebaseAuthException(e.code).message;
      // Re-throwing the exception to handle it elsewhere if needed
    } on FormatException catch (e) {
      throw OFirebaseException(e.message);
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong please try again';
    }
  }
/*-----------------------Federated identity and social sign-in---------------------------*/

  /// [GoogleAuthentication] - GOOGLE
  /// Email Authentication - signIn
  Future<UserCredential> signInWithGoogle() async {
    try {
      //trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      // obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      // create credentials
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      // once user signed in return the userCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw OFirebaseAuthException(e.code).message;
      // Re-throwing the exception to handle it elsewhere if needed
    } on FormatException catch (e) {
      throw OFirebaseException(e.message);
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong please try again';
    }
  }

  /// [FacebookAuthentication] - FACEBOOK
/*-----------------------Federated identity and social sign-in---------------------------*/

  /// [logout user] - valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw OFirebaseAuthException(e.code).message;
      // Re-throwing the exception to handle it elsewhere if needed
    } on FormatException catch (e) {
      throw OFirebaseException(e.message);
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong please try again';
    }
  }

  /// Delete user - remove user Auth and Firestore account
 Future<void> deleteAccount()async {
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    }
    on FirebaseAuthException catch (e) {
      throw OFirebaseAuthException(e.code).message;
      // Re-throwing the exception to handle it elsewhere if needed
    } on FormatException catch (e) {
      throw OFirebaseException(e.message);
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong please try again';
    }

 }

  // Delete the user's account



}
