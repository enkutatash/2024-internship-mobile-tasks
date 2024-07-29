import 'dart:io';

import 'Manager.dart';

void main() {
  Manager manager = Manager();
  while (true) {
    print("1. Add Product");
    print("2. View Products");
    print("3. View Product");
    print("4. Edit Product");
    print("5. Delete Product");
    print("6. Exit");
    print("Enter your choice: ");
    var choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        manager.addProduct();
        break;
      case 2:
        manager.viewProducts();
        break;
      case 3:
        manager.viewProduct();
        break;
      case 4:
        manager.editProduct();
        break;
      case 5:
        manager.deleteProduct();
        break;
      case 6:
        exit(0);
      default:
        print("Invalid choice. Please enter a valid choice.");
    }
  }
}
