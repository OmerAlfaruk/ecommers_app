import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/feature/authentication/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// repository for user related operation.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code.toString());
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code.toString());
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code.toString());
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code.toString());
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }

  Future<void> updateUserData(UserModel updateUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code.toString());
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code.toString());
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code.toString());
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code.toString());
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code.toString());
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code.toString());
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }
  /// upload image

  Future<String> uploadImage(String path,XFile image) async {
    try {
      final ref= FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url=await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.code.toString());
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code.toString());
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }
}
