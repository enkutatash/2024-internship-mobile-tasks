import 'package:ecommerce/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    String? id,
    required String name,
    required String imageUrl,
    required int price,
    required String description,
  }) : super(
            id: id ?? "",
            name: name,
            imageUrl: imageUrl,
            price: price,
            description: description);

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        price: entity.price,
        imageUrl: entity.imageUrl
    );
  }

  factory ProductModel.fromjson(Map<String, dynamic> json) {
   
    return ProductModel(
        id: json['id'].toString(),
        name: json['name'].toString(),
        description: json['description'].toString(),
        price: json['price'].toInt(),
        imageUrl: json['imageUrl'].toString());
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

  Map<String, dynamic> forApi() {
    return {
      'name': name,
      'description': description,
      'price': price.toDouble(),
    };
  }
}
