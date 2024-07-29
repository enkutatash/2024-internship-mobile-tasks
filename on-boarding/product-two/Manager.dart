import 'dart:io';

import 'Product_Model.dart';

class Manager {
  Map<String, Product> Products = {};

  void addProduct() {
    print("Enter Product Name: ");
    var productName = stdin.readLineSync();
    print("Enter Product Description: ");
    var productDescription = stdin.readLineSync();

    double? productPrice;

    while (productPrice == null) {
      print("Enter Product Price: ");
      var inputPrice = stdin.readLineSync();

      try {
        productPrice = double.parse(inputPrice!);
      } catch (e) {
        print("Invalid value. Please enter a valid number for the price.");
      }
    }

    if (productName != null) {
      Product product = Product(
          name: productName,
          description: productDescription,
          price: productPrice);
      Products[productName] = product;
    }
  }

  void viewProducts() {
    print("Name \t\t Description \t\t Price");
    Products.forEach((key, value) {
      print("${value.name}\t ${value.description}\t ${value.price}");
    });
  }

  void viewProduct() {
    print("Enter Product Name: ");
    var productName = stdin.readLineSync();
    if (productName != null && Products.containsKey(productName)) {
      var product = Products[productName]!;
      print("Name \t\t Description \t\t Price");
      print("${product.name}\t ${product.description}\t ${product.price}");
    } else {
      print("No available product with the name $productName");
    }
  }

  void editProduct() {
    print("Enter Product Name: ");
    var productName = stdin.readLineSync();

    if (productName == null || !Products.containsKey(productName)) {
      print("No available product with the name $productName");
      return;
    }

    var product = Products[productName]!;

    // Display current product details
    print("Name \t\t Description \t\t Price");
    print("${product.name}\t ${product.description}\t ${product.price}");

    // Prompt user for edit choice
    print("What do you want to edit?");
    print("1. Name");
    print("2. Description");
    print("3. Price");
    var choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        print("Enter new name: ");
        var newName = stdin.readLineSync();
        if (newName != null && newName.isNotEmpty) {
          // Check if the new name already exists
          if (Products.containsKey(newName)) {
            print("A product with this name already exists.");
          } else {
            // Remove the old product and add the updated product with the new name
            Products.remove(productName);
            product.name = newName;
            Products[newName] = product;
          }
        } else {
          print("Invalid name.");
        }
        break;

      case "2":
        print("Enter new description: ");
        var newDescription = stdin.readLineSync();
        product.description = newDescription;
        break;

      case "3":
        print("Enter new price: ");
        var newPrice = stdin.readLineSync();
        try {
          product.price = double.parse(newPrice!);
        } catch (e) {
          print("Invalid price format.");
          return;
        }
        break;

      default:
        print("Invalid choice.");
    }

    print("Product edited successfully.");
  }

  void deleteProduct() {
    print("Enter Product Name: ");
    var productName = stdin.readLineSync();
    if (productName != null && Products.containsKey(productName)) {
      var product = Products[productName]!;
      print("Name \t\t Description \t\t Price");
      print("${product.name}\t ${product.description}\t ${product.price}");
      print("Are you sure you want to delete this product? (Y/N)");
      var confirmation = stdin.readLineSync();
      if (confirmation == "Y" || confirmation == "y") {
        Products.remove(productName);
        print("Product deleted successfully.");
      } else {
        print("Product deletion cancelled.");
      }
    } else {
      print("No available product with the name $productName");
    }
  }
}
