import 'package:auvnet_internship_assessment/core/common/helper/location_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRemoteDataSource {
  Future<Position> getLocation();
  Future<Placemark?> getAddressFromCoordinates(
    double latitude,
    double longitude,
  );
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final LocationService locationService;

  LocationRemoteDataSourceImpl(this.locationService);

  @override
  Future<Position> getLocation() => locationService.getLocation();

  @override
  Future<Placemark?> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) => locationService.getAddressFromCoordinates(latitude, longitude);
}
