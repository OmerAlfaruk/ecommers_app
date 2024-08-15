import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/feature/shop/models/product_attribute_model.dart';
import 'package:ecommerce/feature/shop/models/product_variation_model.dart';

import 'brand_model.dart';

class ProductModel{
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;

  List<ProductAttributeModel>? productAttribute;
  List<ProductVariationModel>? productVariation;
  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice=0.0,
    this.isFeatured,
    this.description,
    this.categoryId,
    this.productAttribute,
    this.productVariation,
    
});
  static ProductModel empty()=>ProductModel(id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');
  /// Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'Stock': stock,
      'SKU': sku,
      'Price': price,
      'Title': title,
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'Description': description,
      'CategoryId': categoryId,
      'Images': images??[],
      'ProductType': productType,
      'ProductAttribute': productAttribute != null? productAttribute!.map((attr) => attr.toJson()).toList():[],
      'ProductVariation': productVariation!=null? productVariation!.map((variation) => variation.toJson()).toList():[],
    };
  }
  // Create ProductModel from JSON
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data()==null) return  ProductModel.empty();
    final data=document.data()!;


    return ProductModel(
      id: document.id,
      stock: data['Stock']??0,
      sku: data['SKU'],
      price: double.parse((data['Price'] ?? 0.0).toString()),
      title: data['Title'],
      salePrice:double.parse((data['salePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail']??'',
      isFeatured: data['IsFeatured']?? false,
      brand: BrandModel.fromJson(data['Brand']),
      description: data['Description']??'',
      categoryId: data['CategoryId']??'',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productType: data['ProductType']??'',
      productAttribute: (data['ProductAttribute'] as List<dynamic>).map((e)=>ProductAttributeModel.fromJson(e)).toList(),
      productVariation: (data['ProductVariation'] as List<dynamic>).map((e)=>ProductVariationModel.fromJson(e)).toList(),
    );
  }
}