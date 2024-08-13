import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

enum HomePageStatus { initial, loading, success, failure }



class HomePageState extends Equatable {
  final HomePageStatus status;
  final List<ProductEntity> productEntity;

  const HomePageState({
    this.status = HomePageStatus.initial,
    this.productEntity = const [],
  });

  HomePageState copyWith({
    HomePageStatus? status,
    List<ProductEntity>? productEntity,
  }) {
    return HomePageState(
      status: status ?? this.status,
      productEntity: productEntity ?? this.productEntity,
    );
  }

  @override
  List<Object?> get props => [status, productEntity];
}
