import 'package:auvnet_internship_assessment/core/errors/auth_exception.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AuthException, void>> signUp(UserEntity user);

  Future<Either<AuthException, void>> signIn(UserEntity user);
}
