import '../entity/nearby_restaurant_entity.dart';
import '../repo/nearby_restaurant_repository.dart';

class GetNearbyRestaurantsUseCase {
  final NearbyRestaurantRepository repository;

  GetNearbyRestaurantsUseCase(this.repository);

  Future<List<NearbyRestaurantEntity>> call() async {
    return await repository.getNearbyRestaurants();
  }
}
