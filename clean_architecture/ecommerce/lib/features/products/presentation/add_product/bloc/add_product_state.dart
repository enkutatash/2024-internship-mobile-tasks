// part of 'add_product_bloc.dart';

// enum AddProductStatus { initial, loading, loaded, failure }

// class AddProductState extends Equatable {
//   final AddProductStatus status;
//   final String name;
//   final String description;
//   final double price;
//   final String imageUrl;

//   const AddProductState({
//     this.status = AddProductStatus.initial,
//     this.name = '',
//     this.description = '',
//     this.price = 0.0,
//     this.imageUrl = '',
//   });

//   AddProductState copyWith({
//     AddProductStatus? status,
//     String? name,
//     String? description,
//     double? price,
//     String? imageUrl,
//   }) {
//     return AddProductState(
//       status: status ?? this.status,
//       name: name ?? this.name,
//       description: description ?? this.description,
//       price: price ?? this.price,
//       imageUrl: imageUrl ?? this.imageUrl,
//     );
//   }

//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
