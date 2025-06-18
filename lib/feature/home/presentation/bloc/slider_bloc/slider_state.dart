part of 'slider_bloc.dart';

class SliderState extends Equatable {
  final bool isLoading;
  final List<SliderImageEntity> images;
  final String? error;

  const SliderState({
    this.isLoading = false,
    this.images = const [],
    this.error,
  });

  SliderState copyWith({
    bool? isLoading,
    List<SliderImageEntity>? images,
    String? error,
  }) {
    return SliderState(
      isLoading: isLoading ?? this.isLoading,
      images: images ?? this.images,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, images, error];
}
