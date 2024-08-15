import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeature;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeature,
    this.parentId = '',
  });

  /// Empty helper Function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', isFeature: false, image: '');

  /// convert model to json structure so that you can store data in fire base
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeature': isFeature,
    };
  }

  /// map json oriented document snapshot from firebase to model
  factory CategoryModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          isFeature: data['IsFeature'] ?? false,
          parentId: data['ParentId'] ?? '');
    } else {
      return CategoryModel.empty();
    }
  }
}
