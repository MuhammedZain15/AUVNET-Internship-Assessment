import 'package:auvnet_internship_assessment/core/errors/failure.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/entity/user_profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfileEntity>> getUserProfile(String userId);
}
