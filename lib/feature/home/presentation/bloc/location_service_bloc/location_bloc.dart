import 'package:auvnet_internship_assessment/feature/home/domain/usecases/get_location_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'location_state.dart';

part 'location_event.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUseCase getLocationUseCase;

  LocationBloc({required this.getLocationUseCase})
    : super(const LocationState()) {
    on<FetchLocationEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      final result = await getLocationUseCase();
      result.fold(
        (failure) =>
            emit(state.copyWith(isLoading: false, error: failure.message)),
        (location) =>
            emit(state.copyWith(isLoading: false, location: location)),
      );
    });
  }
}
