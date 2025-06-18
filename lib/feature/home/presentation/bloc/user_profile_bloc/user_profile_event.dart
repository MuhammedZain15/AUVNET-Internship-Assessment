part of 'user_profile_bloc.dart';

abstract class UserProfileEvent {}

class FetchUserProfileEvent extends UserProfileEvent {
  final String userId;

  FetchUserProfileEvent(this.userId);
}
