import 'package:hive/hive.dart';

class SliderImageLocalDataSource {
  final Box box;
  SliderImageLocalDataSource(this.box);

  Future<void> cacheSliderImages(List<String> images) async {
    await box.put('sliderImages', images);
  }

  List<String>? getCachedSliderImages() {
    return box.get('sliderImages')?.cast<String>();
  }
}
