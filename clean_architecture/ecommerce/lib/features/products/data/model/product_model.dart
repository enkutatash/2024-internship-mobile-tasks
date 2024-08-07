import 'package:ecommerce/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String id,
    required String name,
    required String imageUrl,
    required int price,
    required String description,
  }) : super(
            id: id,
            name: name,
            imageUrl: imageUrl,
            price: price,
            description: description);

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
