import 'package:auvnet_internship_assessment/core/errors/auth_exception.dart';
import 'package:auvnet_internship_assessment/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/entity/user_entity.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  AuthRepositoryImpl(this.remote);

  @override
  Future<Either<AuthException, void>> signUp(UserEntity user) async {
    try {
      await remote.signUp(user);
      return const Right(null);
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<AuthException, void>> signIn(UserEntity user) async {
    try {
      await remote.signIn(user);

      return const Right(null);
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }
}
