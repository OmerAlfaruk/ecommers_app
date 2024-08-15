class BrandModel{
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;


  /// Empty Helper Function

  BrandModel({
    required this.id, required this.name, required this.image, this.isFeatured,this.productCount
});
static BrandModel empty()=>BrandModel(id: '', name: '', image: '');

/// Convert model to Json structure so you can store data in firebase
toJson(){
  return{
    'Id':id,
    'Name':name,
    'Image':image,
    'ProductsCount':productCount,
    'IsFeatured':isFeatured
  };
}

/// Map Json Oriented document snapshot from Firebase to User Model
factory BrandModel.fromJson(Map<String,dynamic> document){
  final data=document;
  if(data.isEmpty) return BrandModel.empty();
  return BrandModel(id: data['Id'], name: data['Name'], image: data['Image']);
}


}