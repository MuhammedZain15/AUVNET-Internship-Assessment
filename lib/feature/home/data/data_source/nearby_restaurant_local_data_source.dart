import 'package:hive/hive.dart';
import '../../domain/entity/nearby_restaurant_entity.dart';

abstract class NearbyRestaurantLocalDataSource {
  Future<void> cacheNearbyRestaurants(List<NearbyRestaurantEntity> restaurants);
  Future<List<NearbyRestaurantEntity>> getCachedNearbyRestaurants();
}

class NearbyRestaurantLocalDataSourceImpl
    implements NearbyRestaurantLocalDataSource {
  final Box box;

  NearbyRestaurantLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheNearbyRestaurants(
    List<NearbyRestaurantEntity> restaurants,
  ) async {
    await box.put(
      'nearby_restaurants',
      restaurants
          .map(
            (e) => {
              'imageUrl': e.imageUrl,
              'restaurantName': e.restaurantName,
              'time': e.time,
            },
          )
          .toList(),
    );
  }

  @override
  Future<List<NearbyRestaurantEntity>> getCachedNearbyRestaurants() async {
    final data = box.get('nearby_restaurants', defaultValue: []);
    return (data as List)
        .map(
          (e) => NearbyRestaurantEntity(
            imageUrl: e['imageUrl'],
            restaurantName: e['restaurantName'],
            time: e['time'],
          ),
        )
        .toList();
  }
}
