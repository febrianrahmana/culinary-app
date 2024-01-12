import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  final String? email;
  String? password;
  final String? name;

  UserModel({this.uid, this.email, this.password, this.name});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        name = doc.data()!["name"];

  UserModel copyWith({
    String? uid,
    String? email,
    String? password,
    String? name,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }
}