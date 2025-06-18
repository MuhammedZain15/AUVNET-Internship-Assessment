import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_nearby_restaurants_usecase.dart';
import 'nearby_restaurant_event.dart';
import 'nearby_restaurant_state.dart';

class NearbyRestaurantBloc
    extends Bloc<NearbyRestaurantEvent, NearbyRestaurantState> {
  final GetNearbyRestaurantsUseCase getNearbyRestaurantsUseCase;

  NearbyRestaurantBloc(this.getNearbyRestaurantsUseCase)
    : super(NearbyRestaurantInitial()) {
    on<LoadNearbyRestaurants>((event, emit) async {
      emit(NearbyRestaurantLoading());
      try {
        final restaurants = await getNearbyRestaurantsUseCase();
        emit(NearbyRestaurantLoaded(restaurants));
      } catch (e) {
        emit(NearbyRestaurantError(e.toString()));
      }
    });
  }
}
