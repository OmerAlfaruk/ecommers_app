import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/feature/shop/models/enum/enum.dart';
import 'package:ecommerce/feature/shop/models/product_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce/utils/storage_service/firebase_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// firestore instance for database interaction

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async{

  try{
    final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
    return snapshot.docs.map((e)=>ProductModel.fromSnapshot(e)).toList();
  }on FirebaseException catch(e){
        throw OFirebaseException(e.code).message;

      }on PlatformException catch(e){
        throw OPlatformException(e.code).message;

      }
      catch(e){
        throw 'Something went wrong please try again';

      }


}
  /// Get limited Featured Product

  /// upload dummy data to cloud firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // upload all the products along with their images
      final storage = Get.put(OFirebaseStorageService());

      // Loop through each Product
      for (var product in products) {
        // get image data link from Local assets
        final thumbnail = await storage.getImageFromAssets(product.thumbnail);

        // upload image and get its url

        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign Url to product.thumbnail attribute
        product.thumbnail = url;

        // Product List of Images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            // Get images data link from local assets

            final assetImage = await storage.getImageFromAssets(image);

            // upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        // upload Variation images
        if(product.productType==ProductType.variable.toString()){

          for(var variation in product.productVariation!){
            // Get image data link from local assets
            final assetImage=await storage.getImageFromAssets(variation.image);

            //  upload image and get its url
            final url=await storage.uploadImageData('Product/Images',assetImage , variation.image);

            // Assign url  to Variation.image attribute
            variation.image=url;
          }
        }
        await _db.collection('Product').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch(e){
      throw OFirebaseException(e.code).message;

    }on PlatformException catch(e){
      throw OPlatformException(e.code).message;

    }
    catch(e){
      throw 'Something went wrong please try again';

    }
  }
  }

