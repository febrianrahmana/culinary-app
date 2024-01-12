part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
 
}

class SignUpUser extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;

  const SignUpUser(this.name, this.email, this.password);

  @override
  List<Object> get props => [name, email, password];
}

class SignOut extends AuthenticationEvent {}