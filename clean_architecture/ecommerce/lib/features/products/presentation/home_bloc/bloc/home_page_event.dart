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

