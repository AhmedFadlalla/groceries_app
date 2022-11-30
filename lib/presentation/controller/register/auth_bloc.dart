import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/enum.dart';

import '../../../core/utils/constrant.dart';
import '../../../domain/use_case/get_prodfile_data_use_case.dart';
import '../../../domain/use_case/logout_use_case.dart';
import '../../../domain/use_case/sign_in_with_email_and_password_use_case.dart';
import '../../../domain/use_case/sign_up_with_email_and_password_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<BaseAuthEvent, AuthState> {
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase;
  final LogoutUseCase logoutUseCase;
  final GetProfileDataUseCase getProfileDataUseCase;
  AuthBloc(
      this.signInWithEmailAndPasswordUseCase,
      this.signUpWithEmailAndPasswordUseCase,
      this.logoutUseCase,
      this.getProfileDataUseCase
      ) :
        super(const AuthState()) {
    on<SignUpEvent>((event, emit)async {
      final result=await signUpWithEmailAndPasswordUseCase(UserParameter(
        name: event.userName,
        email: event.email,
        password: event.password
      ));
      result.fold((l) => emit(
        state.copyWith(
          userSignUpState: RequestState.error,
          userSignUpMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          userSignUpState: RequestState.loaded
        )
      ));
    });
    on<SignInEvent>((event, emit) async{
      final result=await signInWithEmailAndPasswordUseCase(
        UserParameter(name: '', email: event.email, password: event.password)
      );

      print(result);
      result.fold((l) => emit(
        state.copyWith(
          userSignInState: RequestState.error,
          userSignInMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          userSignInState: RequestState.loaded,
          userAccessToken: r
        )
      ));
    });
    on<LogoutEvent>((event, emit) async{
      final result=await logoutUseCase(const NoParameters());

      result.fold((l) {
        print(l.message);
        emit(
        state.copyWith(
          logoutState: RequestState.error,
          logoutMessage: l.message
        )

      );}, (r) => emit(
          state.copyWith(
              logoutState: RequestState.loaded,

          )
      ));
    });
    on<GetUserDataEvent>((event, emit) async{
      final result=await getProfileDataUseCase(const NoParameters());

      result.fold((l) =>
        emit(
            state.copyWith(
                userDataState: RequestState.error,
                userDataMessage: l.message
            )

        ), (r) => emit(
          state.copyWith(
            userDataState: RequestState.loaded,
            userData: r
          )
      ));
    });
  }
}
