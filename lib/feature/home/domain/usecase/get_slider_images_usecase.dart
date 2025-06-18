import 'package:auvnet_internship_assessment/feature/home/domain/entity/slider_image_entity.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/slider_image_repository.dart';

class GetSliderImagesUseCase {
  final SliderImageRepository repository;

  GetSliderImagesUseCase({required this.repository});

  Future<List<SliderImageEntity>> call() async {
    return await repository.getSliderImages();
  }
}
