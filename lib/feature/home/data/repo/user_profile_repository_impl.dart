import 'package:auvnet_internship_assessment/core/errors/failure.dart';
import 'package:auvnet_internship_assessment/feature/home/data/data_source/user_profile_data_source.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/entity/user_profile_entity.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/user_profile_repository.dart';
import 'package:dartz/dartz.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource remoteDataSource;
  final UserProfileLocalDataSource localDataSource;

  UserProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile(
    String userId,
  ) async {
    try {
      // Try to get cached data first
      final cachedProfile = await localDataSource.getCachedUserProfile();
      if (cachedProfile != null) {
        return Right(cachedProfile);
      }

      // If no cached data, fetch from remote
      final remoteProfile = await remoteDataSource.getUserProfile(userId);

      // Cache the remote data
      await localDataSource.cacheUserProfile(remoteProfile);

      return Right(remoteProfile);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
