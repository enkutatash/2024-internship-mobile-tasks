part of 'home_page_bloc.dart';

enum HomePageStatus { initial, loading, loaded, failure }

class HomePageState extends Equatable {
  final HomePageStatus status;
  final List<ProductEntity>? products;

  const HomePageState({
    this.status = HomePageStatus.initial,
    this.products = const [],
  });

  HomePageState copyWith({
    HomePageStatus? status,
    List<ProductEntity>? products,
  }) {
    return HomePageState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [status,products];
}