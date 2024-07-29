class Product {
  String? _name, _description;
  double? _price;

  String? get name => _name;
  String? get description => _description;
  double? get price => _price;

  set name(String? value) => _name = value;
  set description(String? value) => _description = value;
  set price(double? value) => _price = value;

  Product({String? name, String? description, double? price}) {
    _name = name;
    _description = description;
    _price = price;
  }
}
