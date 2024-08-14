import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchAllProducts extends HomePageEvent {}

class DeleteProduct extends HomePageEvent {
  final String id;

  DeleteProduct({required this.id});

  @override
  List<Object?> get props => [id];
}

class OnImageChanged extends HomePageEvent {
  final String imageUrl;

  OnImageChanged({required this.imageUrl});
}

class OnNamedChanged extends HomePageEvent {
  final String name;
  OnNamedChanged({required this.name});
}

class OnDescriptionChanged extends HomePageEvent {
  final String description;

  OnDescriptionChanged({required this.description});
}

class OnPriceChanged extends HomePageEvent {
  final double price;

  OnPriceChanged({required this.price});
}

class OnSubmit extends HomePageEvent {}



class AddProductEvent extends HomePageEvent {
  String name;
  String description;
  double price;
  String imageUrl;

  AddProductEvent({
    required this.description,required this.imageUrl,required this.name,required this.price
  });
}


