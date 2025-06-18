part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  final bool isLoading;
  final UserProfileEntity? profile;
  final String? error;

  const UserProfileState({this.isLoading = false, this.profile, this.error});

  UserProfileState copyWith({
    bool? isLoading,
    UserProfileEntity? profile,
    String? error,
  }) {
    return UserProfileState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, profile, error];
}
