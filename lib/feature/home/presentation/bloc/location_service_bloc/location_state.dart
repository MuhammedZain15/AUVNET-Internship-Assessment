import 'package:auvnet_internship_assessment/feature/home/domain/entity/location_entity.dart';
import 'package:equatable/equatable.dart';

class LocationState extends Equatable {
  final bool isLoading;
  final LocationEntity? location;
  final String? error;

  const LocationState({this.isLoading = false, this.location, this.error});

  LocationState copyWith({
    bool? isLoading,
    LocationEntity? location,
    String? error,
  }) {
    return LocationState(
      isLoading: isLoading ?? this.isLoading,
      location: location ?? this.location,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, location, error];
}
