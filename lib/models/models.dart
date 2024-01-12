import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? name;

  const UserModel({this.id, this.email, this.password, this.name});

  static const empty = UserModel(id:'');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [id, email, password, name];
}