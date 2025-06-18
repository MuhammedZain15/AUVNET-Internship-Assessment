import 'package:auvnet_internship_assessment/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/location_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, LocationEntity>> getLocation();
}
