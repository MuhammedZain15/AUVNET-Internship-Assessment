import 'package:auvnet_internship_assessment/core/errors/auth_exception.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/entity/user_entity.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<AuthException, void>> call(UserEntity user) =>
      repository.signIn(user);
}
