import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

enum HomePageStatus { initial, loading, success, failure }

class HomePageState extends Equatable {
  final HomePageStatus status;
  final List<ProductEntity> productEntity;
  final String? name;
  final String? imageUrl;
  final String? description;
  final double? price;

  const HomePageState({
    this.status = HomePageStatus.initial,
    this.productEntity = const [],
    this.name = '',
    this.description = '',
    this.imageUrl =
        "https://st4.depositphotos.com/14953852/24787/v/380/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg",
    this.price = 0.0,
  });

  HomePageState copyWith({
    HomePageStatus? status,
    List<ProductEntity>? productEntity,
    final String? name,
    final String? imageUrl,
    final String? description,
    final double? price,
  }) {
    return HomePageState(
        status: status ?? this.status,
        productEntity: productEntity ?? this.productEntity,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        price: price ?? this.price);
  }

  @override
  List<Object?> get props => [status, productEntity, imageUrl, name, description, price];
}
