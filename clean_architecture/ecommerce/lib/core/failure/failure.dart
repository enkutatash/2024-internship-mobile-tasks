import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  String message;
  Failure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
