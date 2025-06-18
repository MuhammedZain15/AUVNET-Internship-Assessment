import '../../../domain/entity/nearby_restaurant_entity.dart';

abstract class NearbyRestaurantState {}

class NearbyRestaurantInitial extends NearbyRestaurantState {}

class NearbyRestaurantLoading extends NearbyRestaurantState {}

class NearbyRestaurantLoaded extends NearbyRestaurantState {
  final List<NearbyRestaurantEntity> restaurants;
  NearbyRestaurantLoaded(this.restaurants);
}

class NearbyRestaurantError extends NearbyRestaurantState {
  final String message;
  NearbyRestaurantError(this.message);
}
