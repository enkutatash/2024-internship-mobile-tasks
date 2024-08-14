part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class FetchAllProducts extends HomePageEvent {}

class DeleteProduct extends HomePageEvent {
  final String id;

  DeleteProduct({required this.id});
}
class AddProductPress extends HomePageEvent {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  AddProductPress({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class UpdateProductPress extends HomePageEvent{
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  UpdateProductPress({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}