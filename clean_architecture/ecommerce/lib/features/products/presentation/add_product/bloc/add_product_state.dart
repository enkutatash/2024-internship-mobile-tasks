part of 'add_product_bloc.dart';

enum AddProductStatus { initial, loading, success, failure }

// ignore: must_be_immutable
class AddProductState extends Equatable {
  final AddProductStatus status;
  String name;
  String description;
  String imageUrl;
  double price;
  AddProductState({
    this.status = AddProductStatus.initial,
    this.name = '',
    this.description = '',
    this.imageUrl = "https://st4.depositphotos.com/14953852/24787/v/380/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg",
    this.price = 0.0,
  });

  AddProductState copyWith({
    AddProductStatus? status,
      String? name,
      String? description,
      String? imageUrl,
      double? price,
  }) {
    return AddProductState(
      status: status ?? this.status,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [status, name, description, imageUrl, price];
}
