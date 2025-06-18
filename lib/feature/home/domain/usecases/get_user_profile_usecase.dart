import 'package:auvnet_internship_assessment/core/errors/failure.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/entity/user_profile_entity.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/user_profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserProfileUseCase {
  final UserProfileRepository repository;

  GetUserProfileUseCase(this.repository);

  Future<Either<Failure, UserProfileEntity>> call(String userId) async {
    return await repository.getUserProfile(userId);
  }
}
