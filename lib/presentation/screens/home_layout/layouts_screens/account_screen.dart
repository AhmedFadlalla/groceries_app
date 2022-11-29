import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/services/cach_helper.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:grocery_app/presentation/controller/register/auth_bloc.dart';
import 'package:grocery_app/presentation/controller/register/auth_event.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:grocery_app/presentation/screens/register/login.dart';

import '../../../../core/services/service_locator.dart';
import '../../../controller/register/auth_state.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc,AuthState>(
          builder: (context,state){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                defaultButton(function: (){
                  sl<AuthBloc>().add(LogoutEvent());
                }, text: "Logout")
              ],
            );
          },
          listener: (context,state){
            if(state.logoutState==RequestState.loaded){
              CachHelper.removeData(key: "uId").then((value) {
                navigateTo(context, LoginScreen());
              });
            }
          }),
    );
  }
}
