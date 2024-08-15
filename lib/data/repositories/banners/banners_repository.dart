import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/feature/shop/models/banner_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannersRepository extends GetxController {


  /// variables
  static BannersRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
final result=await _db.collection('Banners').where('active',isEqualTo: true).get();
return result.docs.map((documentSnapshot)=>BannerModel.fromSnapshot(documentSnapshot)).toList();
    }
    on FirebaseException catch (e) {
      throw OFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong please try again';
    }
  }

/// upload banners to the cloud Firebase

}