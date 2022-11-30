import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:grocery_app/domain/entities/base_user_data.dart';

import '../../../domain/entities/base_auth_data.dart';

class AuthState extends Equatable{
  final RequestState userSignUpState;
  final String userSignUpMessage;
  final BaseAuthData? userAccessToken;
  final RequestState userSignInState;
  final String userSignInMessage;
  final RequestState logoutState;
  final String logoutMessage;
  final BaseUserData? userData;
  final RequestState userDataState;
  final String userDataMessage;

 const  AuthState(
      {
        this.userSignUpState=RequestState.loading,
      this.userSignUpMessage='',
      this.userAccessToken,
      this.userSignInState=RequestState.loading,
      this.userSignInMessage='',
      this.logoutState=RequestState.loading,
      this.logoutMessage='',
        this.userData,
        this.userDataState=RequestState.loading,
        this.userDataMessage=''
      });


   AuthState copyWith({
RequestState? userSignUpState,
     String? userSignUpMessage,
     BaseAuthData? userAccessToken,
     RequestState? userSignInState,
     String? userSignInMessage,
     RequestState? logoutState,
     String? logoutMessage,
      BaseUserData? userData,
      RequestState? userDataState,
      String? userDataMessage,
}) {
     return AuthState(
         userSignUpState: userSignUpState??this.userSignUpState,
         userSignUpMessage: userSignUpMessage??this.userSignUpMessage,
         userAccessToken: userAccessToken??this.userAccessToken,
         userSignInState: userSignInState??this.userSignInState,
         userSignInMessage: userSignInMessage??this.userSignInMessage,
       logoutState: logoutState??this.logoutState,
       logoutMessage: logoutMessage??this.logoutMessage,
       userData: userData??this.userData,
       userDataState: userDataState??this.userDataState,
       userDataMessage: userDataMessage??this.userDataMessage
     );
   }

  @override
  List<Object?> get props => [
    userSignUpState,userSignUpMessage,
    userAccessToken,userSignInState,userSignInMessage,
    logoutState,logoutMessage,
    userData,userDataState,userDataMessage
  ];
}
