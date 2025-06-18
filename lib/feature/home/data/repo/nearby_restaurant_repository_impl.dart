import '../../domain/entity/nearby_restaurant_entity.dart';
import '../../domain/repo/nearby_restaurant_repository.dart';
import '../data_source/nearby_restaurant_local_data_source.dart';
import '../data_source/nearby_restaurant_remote_data_source.dart';

class NearbyRestaurantRepositoryImpl implements NearbyRestaurantRepository {
  final NearbyRestaurantRemoteDataSource remoteDataSource;
  final NearbyRestaurantLocalDataSource localDataSource;

  NearbyRestaurantRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<NearbyRestaurantEntity>> getNearbyRestaurants() async {
    try {
      final remoteData = await remoteDataSource.getNearbyRestaurants();
      await localDataSource.cacheNearbyRestaurants(remoteData);
      return remoteData;
    } catch (_) {
      return await localDataSource.getCachedNearbyRestaurants();
    }
  }
}
