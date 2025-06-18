import 'package:auvnet_internship_assessment/feature/auth/domain/entity/user_entity.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:auvnet_internship_assessment/feature/auth/domain/usecase/signup_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signIn;
  final SignUpUseCase signUp;

  AuthBloc({required this.signIn, required this.signUp})
    : super(const AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(const AuthLoading());
      final result = await signIn(event.user);
      result.fold(
        (failure) => emit(AuthFailure(failure.toString())),
        (_) => emit(const AuthSuccess()),
      );
    });

    on<SignUpRequested>((event, emit) async {
      emit(const AuthLoading());
      final result = await signUp(event.user);
      result.fold(
        (failure) => emit(AuthFailure(failure.toString())),
        (_) => emit(const AuthSuccess()),
      );
    });
  }
}
