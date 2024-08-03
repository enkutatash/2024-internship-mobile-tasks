import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productList = [
    Product(
        imagePath: 'assets/images/shoe.jpg',
        name: 'Derby Leather Shoes',
        price: 120,
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
        category: 'maleShoes',
        size: 41,
        star: 4.0),
    Product(
        imagePath: 'assets/images/shoe.jpg',
        name: 'Derby Leather Shoes',
        price: 120,
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
        category: 'maleShoes',
        size: 39,
        star: 4.0),
    Product(
        imagePath: 'assets/images/shoe.jpg',
        name: 'Derby Leather Shoes',
        price: 120,
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
        category: 'maleShoes',
        size: 45,
        star: 4.0),
  ];

  void addProduct(Product item) {
    productList.add(item);
    debugPrint("Product Added ${item.name}");
    notifyListeners();
  }

  void updateProduct(Product? oldProduct, Product newProduct) {
    productList.remove(oldProduct);
    productList.add(newProduct);
    debugPrint("Product updated ${newProduct.name}");
    notifyListeners();
  }

  void deleteProduct(Product item) {
    productList.remove(item);
    debugPrint("Product deleted ${item.name}");
    notifyListeners();
  }
}
