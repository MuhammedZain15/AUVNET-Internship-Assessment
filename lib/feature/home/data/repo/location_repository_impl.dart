import 'package:auvnet_internship_assessment/core/errors/failure.dart';
import 'package:auvnet_internship_assessment/feature/home/data/data_source/location_service_data_source.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/entity/location_entity.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/location_repository.dart';
import 'package:dartz/dartz.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LocationEntity>> getLocation() async {
    try {
      final position = await remoteDataSource.getLocation();
      final placemark = await remoteDataSource.getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );

      return Right(
        LocationEntity(
          latitude: position.latitude,
          longitude: position.longitude,
          city: placemark?.locality,
          country: placemark?.country,
        ),
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
