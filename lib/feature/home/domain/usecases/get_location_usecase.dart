import 'package:auvnet_internship_assessment/core/errors/failure.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/entity/location_entity.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetLocationUseCase {
  final LocationRepository repository;

  GetLocationUseCase(this.repository);

  Future<Either<Failure, LocationEntity>> call() async {
    return await repository.getLocation();
  }
}
