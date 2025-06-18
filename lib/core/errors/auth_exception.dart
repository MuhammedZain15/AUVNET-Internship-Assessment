import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return 'AuthException: $message';
  }
}

class AuthErrorHandler {
  static AuthException handle(dynamic e) {
    if (e is FirebaseAuthException) {
      return AuthException(
        e.message ?? "An unknown Firebase Auth error occurred",
      );
    } else if (e is Exception) {
      return AuthException(e.toString());
    } else {
      return AuthException("An unexpected error occurred");
    }
  }
}
