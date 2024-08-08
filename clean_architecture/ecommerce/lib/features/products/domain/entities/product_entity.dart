import 'dart:io';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  String id;
  String name;
  String imageUrl;
  int price;
  String description;

  ProductEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});

  @override
  List<Object?> get props => [id,name,imageUrl,price,description];
}
