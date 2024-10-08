class Product {
  final String imagePath;
  final String name;
  final double price;
  final String description;
  final String category;
  final int size;
  double star = 0;

  Product({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.size,
    this.star = 0,
  });
}

enum Size {
  small,
  mid,
  large,
  xLarge,
  xxLarge,
  xxxLarge,
}
