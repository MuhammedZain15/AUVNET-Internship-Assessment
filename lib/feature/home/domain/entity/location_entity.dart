class LocationEntity {
  final double latitude;
  final double longitude;
  final String? city;
  final String? country;

  const LocationEntity({
    required this.latitude,
    required this.longitude,
    this.city,
    this.country,
  });

  String get formattedCoordinates =>
      "${latitude.toStringAsFixed(2)}, ${longitude.toStringAsFixed(2)}";

  String get formattedAddress {
    if (city != null && country != null) {
      return "$city, $country";
    }
    return formattedCoordinates;
  }

  bool get hasAddress => city != null && country != null;

  LocationEntity copyWith({
    double? latitude,
    double? longitude,
    String? city,
    String? country,
  }) {
    return LocationEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationEntity &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.city == city &&
        other.country == country;
  }

  @override
  int get hashCode => Object.hash(latitude, longitude, city, country);
}
