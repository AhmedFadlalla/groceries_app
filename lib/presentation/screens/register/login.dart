import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/services/cach_helper.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:grocery_app/presentation/controller/register/auth_state.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:grocery_app/presentation/screens/register/register_screen.dart';

import '../../../core/services/service_locator.dart';

import '../../controller/register/auth_bloc.dart';
import '../../controller/register/auth_event.dart';
import '../component/custom_main_page.dart';
import '../home_layout/home_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context)=> sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc,AuthState>(
        builder: (context,state) {
          return ScreenUtilInit(
            builder:(context,Widget? widget)=> Scaffold(
              body: Form(
                key: formKey,
                child: SafeArea(
                    child: CustomMainPage(
                      widget: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Image(image: AssetImage('assets/icons/red.png'))),
                              SizedBox(
                                height: height * 0.2,
                              ),
                              Text(
                                'Logining',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(color: Colors.black, fontSize: 30.sp),
                              ),
                              Text(
                                'Enter Your email and password',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.grey, fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              defaultFormField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                label: 'email',
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'email must not be empty';
                                  }
                                  return null;
                                },),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              defaultFormField(
                                controller: passwordController,
                                type: TextInputType.text,
                                suffixIcon: Icons.visibility,
                                sufixPressed: (){

                                },
                                label: 'password',
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'password must not be empty';
                                  }
                                  return null;
                                },),
                              SizedBox(height: height*0.1,),
                              defaultButton(
                                  function: (){
                                    if(formKey.currentState!.validate()){
                                      sl<AuthBloc>().add(
                                          SignInEvent(
                                              email: emailController.text,
                                              password: passwordController.text)
                                      );
                                    }
                                  }, text: 'Sign in'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account?'),
                                  TextButton(onPressed: (){
                                    navigateTo(context, SignUpScreen());
                                  }, child: Text('Sign up'))
                                ],)

                            ],
                          ),
                        ),
                      ),)),
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state.userAccessToken !=null){
            print(state.userAccessToken);
            CachHelper.saveData(key: "uId", value: state.userAccessToken!.token)
                .then((value) {
              showToast(text: "Login Successfully", state: ToastStates.SUCCESS);
              navigateTo(context, const HomeLayout());
            });

          }
          if(state.userSignInState==RequestState.error){
            showToast(text: state.userSignInMessage, state: ToastStates.SUCCESS);
          }
      })
    );
  }
}
