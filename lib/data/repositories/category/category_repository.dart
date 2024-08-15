import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/feature/shop/models/category_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce/utils/storage_service/firebase_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  /// Get All categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list =
          snapshot.docs.map((doc) => CategoryModel.fromSnapShot(doc)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw OFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw OPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  /// upload Categories to the cloud fire store
Future<void> uploadDummyData(List<CategoryModel> categories)async{
    try{
      // upload all category along with their images
      final storage = Get.put(OFirebaseStorageService());

      // loop through each category
      for(var category in categories){

        // get image data link from the local assets

        final file= await storage.getImageFromAssets(category.image);

        // upload image and get its url
        final url=await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to Category image attribute
        category.image=url;

        // store category in fireStore
        await _db.collection('Categories').doc(category.id).set(category.toJson());


      }

  }on FirebaseException catch(e){
      throw OFirebaseException(e.code).message;

  }on PlatformException catch(e){
      throw OPlatformException(e.code).message;

  }
    catch(e){
      throw 'Something went wrong please try again';

    }
  }

}
