import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/utils/enum.dart';

import '../../../domain/entities/base_auth_data.dart';

class AuthState extends Equatable{
  final RequestState userSignUpState;
  final String userSignUpMessage;
  final BaseAuthData? userAccessToken;
  final RequestState userSignInState;
  final String userSignInMessage;
  final RequestState logoutState;
  final String logoutMessage;

  AuthState(
      {
        this.userSignUpState=RequestState.loading,
      this.userSignUpMessage='',
      this.userAccessToken,
      this.userSignInState=RequestState.loading,
      this.userSignInMessage='',
      this.logoutState=RequestState.loading,
      this.logoutMessage=''});


   AuthState copyWith({
RequestState? userSignUpState,
     String? userSignUpMessage,
     BaseAuthData? userAccessToken,
     RequestState? userSignInState,
     String? userSignInMessage,
     RequestState? logoutState,
     String? logoutMessage
}) {
     return AuthState(
         userSignUpState: userSignUpState??this.userSignUpState,
         userSignUpMessage: userSignUpMessage??this.userSignUpMessage,
         userAccessToken: userAccessToken??this.userAccessToken,
         userSignInState: userSignInState??this.userSignInState,
         userSignInMessage: userSignInMessage??this.userSignInMessage,
       logoutState: logoutState??this.logoutState,
       logoutMessage: logoutMessage??this.logoutMessage
     );
   }

  @override
  List<Object?> get props => [
    userSignUpState,userSignUpMessage,
    userAccessToken,userSignInState,userSignInMessage,
    logoutState,logoutMessage
  ];
}
