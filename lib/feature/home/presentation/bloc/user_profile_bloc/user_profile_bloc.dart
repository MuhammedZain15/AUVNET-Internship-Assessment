import 'package:auvnet_internship_assessment/feature/home/domain/entity/user_profile_entity.dart';
import 'package:auvnet_internship_assessment/feature/home/domain/usecases/get_user_profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetUserProfileUseCase getUserProfileUseCase;

  UserProfileBloc({required this.getUserProfileUseCase})
    : super(const UserProfileState()) {
    on<FetchUserProfileEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      final result = await getUserProfileUseCase(event.userId);

      result.fold(
        (failure) =>
            emit(state.copyWith(isLoading: false, error: failure.message)),
        (profile) => emit(state.copyWith(isLoading: false, profile: profile)),
      );
    });
  }
}
