import '../entity/nearby_restaurant_entity.dart';

abstract class NearbyRestaurantRepository {
  Future<List<NearbyRestaurantEntity>> getNearbyRestaurants();
}
