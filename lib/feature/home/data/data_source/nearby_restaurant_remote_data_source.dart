import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entity/nearby_restaurant_entity.dart';

abstract class NearbyRestaurantRemoteDataSource {
  Future<List<NearbyRestaurantEntity>> getNearbyRestaurants();
}

class NearbyRestaurantRemoteDataSourceImpl
    implements NearbyRestaurantRemoteDataSource {
  final FirebaseFirestore firestore;

  NearbyRestaurantRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<NearbyRestaurantEntity>> getNearbyRestaurants() async {
    final snapshot = await firestore.collection('nearby-restaurant').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return NearbyRestaurantEntity(
        imageUrl: data['imageUrl'] ?? '',
        restaurantName: data['restaurantName'] ?? '',
        time: data['time'] ?? '',
      );
    }).toList();
  }
}
