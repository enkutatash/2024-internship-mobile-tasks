import 'package:ecommerce/features/products/data/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var product = ProductModel(
      id: "6672752cbd218790438efdb0",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123,
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg");

  var jsonData = {
    "id": "6672752cbd218790438efdb0",
    "name": "Anime website",
    "description": "Explore anime characters.",
    "price": 123,
    "imageUrl":
        "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
  };
  test('toJson should convert TaskModel to JSON', () {
    var result = product.toJson();
    var expectedJson = {
      "id": "6672752cbd218790438efdb0",
      "name": "Anime website",
      "description": "Explore anime characters.",
      "price": 123.0,
      "imageUrl":
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
    };

    expect(result, expectedJson);
  });

  test('from json should convert json to Product model', () {
    final result = ProductModel.fromjson(jsonData);
    expect(result, product);
  });
}
