import '../entity/slider_image_entity.dart';
import '../repo/slider_image_repository.dart';

class GetSliderImagesUseCase {
  final SliderImageRepository repo;

  GetSliderImagesUseCase(this.repo);

  Future<List<SliderImageEntity>> call() {
    return repo.getSliderImages();
  }
}
