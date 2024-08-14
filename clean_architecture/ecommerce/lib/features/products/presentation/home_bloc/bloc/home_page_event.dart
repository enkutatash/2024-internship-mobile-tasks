part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class FetchAllProducts extends HomePageEvent {}

class DeleteProduct extends HomePageEvent {
  final String id;

  DeleteProduct({required this.id});
}