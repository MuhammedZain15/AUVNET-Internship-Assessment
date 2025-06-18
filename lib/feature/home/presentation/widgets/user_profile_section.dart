import 'package:auvnet_internship_assessment/core/config/theme/app_text_styles.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          );
        } else if (state.error != null) {
          return Text(
            'Error: ${state.error}',
            style: AppTextStyles.homeStyleWhite.copyWith(
              color: Colors.red[100],
            ),
          );
        } else if (state.profile != null) {
          return Text(
            'Hi ${state.profile!.name}',
            style: AppTextStyles.homeStyleWhite,
          );
        }
        return Text('Hi User', style: AppTextStyles.homeStyleWhite);
      },
    );
  }
}
