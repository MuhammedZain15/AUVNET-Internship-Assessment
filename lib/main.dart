import 'package:auvnet_internship_assessment/core/common/helper/service_locator.dart';
import 'package:auvnet_internship_assessment/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/location_service_bloc/location_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/nearby_restaurant_bloc/nearby_restaurant_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/slider_bloc/slider_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/pages/home_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/config/theme/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment variables
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Hive for local storage
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('authBox');
  await Hive.openBox('sliderImagesBox');
  await Hive.openBox('nearbyRestaurantBox');
  // Initialize service locator
  await initServiceLocator();
  // hide statue bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<AuthBloc>()),
            BlocProvider(create: (_) => sl<LocationBloc>()),
            BlocProvider(create: (_) => sl<SliderBloc>()),
            BlocProvider(create: (_) => sl<UserProfileBloc>()),
            BlocProvider(create: (_) =>sl<NearbyRestaurantBloc>())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: const HomeLayout(),
          ),
        );
      },
    );
  }
}
