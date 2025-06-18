import '../entity/slider_image_entity.dart';

abstract class SliderImageRepository {
  Future<List<SliderImageEntity>> getSliderImages();
}
