import 'package:auvnet_internship_assessment/core/common/helper/location_service.dart';
import 'package:auvnet_internship_assessment/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:auvnet_internship_assessment/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/repo/auth_repo.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/usecase/signup_usecase.dart';
import 'package:auvnet_internship_assessment/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/data/data_source/location_service_data_source.dart';
import 'package:auvnet_internship_assessment/feature/home/data/data_source/slider_image_local_data_source.dart';
import 'package:auvnet_internship_assessment/feature/home/data/data_source/slider_image_remote_data_source.dart';
import 'package:auvnet_internship_assessment/feature/home/data/data_source/user_profile_data_source.dart';
import 'package:auvnet_internship_assessment/feature/home/data/data_source/nearby_restaurant_local_data_source.dart';
import 'package:auvnet_internship_assessment/feature/home/data/data_source/nearby_restaurant_remote_data_source.dart';
import 'package:auvnet_internship_assessment/feature/home/data/repo/location_repository_impl.dart';
import 'package:auvnet_internship_assessment/feature/home/data/repo/nearby_restaurant_repository_impl.dart';
import 'package:auvnet_internship_assessment/feature/home/data/repo/slider_image_repository_impl.dart';
import 'package:auvnet_internship_assessment/feature/home/data/repo/user_profile_repository_impl.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/location_repository.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/nearby_restaurant_repository.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/slider_image_repository.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/repo/user_profile_repository.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/usecase/get_slider_images_usecase.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/usecases/get_location_usecase.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/usecases/get_user_profile_usecase.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/usecases/get_nearby_restaurants_usecase.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/location_service_bloc/location_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/nearby_restaurant_bloc/nearby_restaurant_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/slider_bloc/slider_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // External
  sl.registerLazySingleton(() => LocationService());
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Hive Boxes
  final authBox = await Hive.openBox('authBox');
  final sliderImagesBox = await Hive.openBox('sliderImagesBox');
  final nearbyRestaurantBox = await Hive.openBox('nearbyRestaurantBox');
  sl.registerLazySingleton<Box>(() => authBox, instanceName: 'authBox');
  sl.registerLazySingleton<Box>(() => sliderImagesBox, instanceName: 'sliderImagesBox');
  sl.registerLazySingleton<Box>(() => nearbyRestaurantBox, instanceName: 'nearbyRestaurantBox');

  // Bloc
  sl.registerFactory(() => AuthBloc(signIn: sl(), signUp: sl()));
  sl.registerFactory(() => LocationBloc(getLocationUseCase: sl()));
  sl.registerFactory(() => UserProfileBloc(getUserProfileUseCase: sl()));
  sl.registerFactory(() => SliderBloc(getSliderImagesUseCase: sl()));
  sl.registerFactory(() => NearbyRestaurantBloc(sl()));

  // Usecases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => GetLocationUseCase(sl()));
  sl.registerLazySingleton(() => GetUserProfileUseCase(sl()));
  sl.registerLazySingleton(() => GetSliderImagesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetNearbyRestaurantsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl(sl()));
  sl.registerLazySingleton<UserProfileRepository>(() => UserProfileRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
  ));
  sl.registerLazySingleton<SliderImageRepository>(() => SliderImageRepositoryImpl(
    remote: sl(),
    local: sl(),
  ));
  sl.registerLazySingleton<NearbyRestaurantRepository>(() => NearbyRestaurantRepositoryImpl(sl(), sl()));

  // DataSources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl(), sl()));
  sl.registerLazySingleton<LocationRemoteDataSource>(() => LocationRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<UserProfileRemoteDataSource>(() => UserProfileRemoteDataSourceImpl(sl(), sl()));
  sl.registerLazySingleton<UserProfileLocalDataSource>(() => UserProfileLocalDataSourceImpl(sl<Box>(instanceName: 'authBox')));
  sl.registerLazySingleton<SliderImageRemoteDataSource>(() => SliderImageRemoteDataSource(sl()));
  sl.registerLazySingleton<SliderImageLocalDataSource>(() => SliderImageLocalDataSource(sl<Box>(instanceName: 'sliderImagesBox')));
  sl.registerLazySingleton<NearbyRestaurantRemoteDataSource>(() => NearbyRestaurantRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<NearbyRestaurantLocalDataSource>(() => NearbyRestaurantLocalDataSourceImpl(sl<Box>(instanceName: 'nearbyRestaurantBox')));
}
