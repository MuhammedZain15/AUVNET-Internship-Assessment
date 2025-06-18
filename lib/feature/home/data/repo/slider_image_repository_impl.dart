import '../../domain/entity/slider_image_entity.dart';
import '../../domain/repo/slider_image_repository.dart';
import '../data_source/slider_image_remote_data_source.dart';
import '../data_source/slider_image_local_data_source.dart';

class SliderImageRepositoryImpl implements SliderImageRepository {
  final SliderImageRemoteDataSource remote;
  final SliderImageLocalDataSource local;

  SliderImageRepositoryImpl({required this.remote, required this.local});

  @override
  Future<List<SliderImageEntity>> getSliderImages() async {
    final cached = local.getCachedSliderImages();
    if (cached != null && cached.isNotEmpty) {
      return cached.map((url) => SliderImageEntity(imageUrl: url)).toList();
    }
    final remoteUrls = await remote.fetchSliderImages();
    await local.cacheSliderImages(remoteUrls);
    return remoteUrls.map((url) => SliderImageEntity(imageUrl: url)).toList();
  }
}
