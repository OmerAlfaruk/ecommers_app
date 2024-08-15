class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel(
      {required this.id,
      this.sku = '',
      this.image = '',
      this.description = '',
      this.salePrice = 0.0,
      this.price = 0.0,
      this.stock = 0,
      required this.attributeValues});

  /// Create Empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  /// Json Format
  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice':salePrice,
      'SKU':sku,
      'Stock':stock,
      'AttributeValue':attributeValues
    };
  }

  /// Map Json Oriented Document snapshot from Firebase to Mode

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
        id: data['id'],
        attributeValues: Map<String, String>.from(data['AttributeValues']),
        price: double.parse((data['Price'] ?? 0.0).toString()),
        sku: data['SKU'] ?? '',
        stock: data['Stock'] ?? '',
        image: data['Image' ?? '']);
  }
}
