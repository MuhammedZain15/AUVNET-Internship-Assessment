part of 'auth_bloc.dart';

abstract class AuthEvent {}
class SignInRequested extends AuthEvent {
  final UserEntity user;
  SignInRequested(this.user);
}
class SignUpRequested extends AuthEvent {
  final UserEntity user;
  SignUpRequested(this.user);
}