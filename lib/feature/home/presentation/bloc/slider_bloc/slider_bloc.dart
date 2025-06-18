import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/entity/slider_image_entity.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/usecase/get_slider_images_usecase.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final GetSliderImagesUseCase getSliderImagesUseCase;

  SliderBloc({required this.getSliderImagesUseCase})
    : super(const SliderState()) {
    on<FetchSliderImagesEvent>(_onFetchSliderImages);
  }

  Future<void> _onFetchSliderImages(
    FetchSliderImagesEvent event,
    Emitter<SliderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final images = await getSliderImagesUseCase();
      emit(state.copyWith(isLoading: false, images: images));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
