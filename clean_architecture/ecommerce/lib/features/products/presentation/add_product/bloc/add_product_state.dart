
import 'package:equatable/equatable.dart';

enum AddProductPageStatus { initial, loading, success, failure }


class AddProductState extends Equatable {
  final AddProductPageStatus status;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  const AddProductState({
    this.status = AddProductPageStatus.initial,
    this.name = '',
    this.description = '',
    this.imageUrl = "https://st4.depositphotos.com/14953852/24787/v/380/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg",
    this.price = 0.0,
  });

  AddProductState copyWith({
    AddProductPageStatus? status,
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
