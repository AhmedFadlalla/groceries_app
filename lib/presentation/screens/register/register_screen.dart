import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:grocery_app/presentation/controller/register/auth_bloc.dart';

import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:grocery_app/presentation/screens/register/login.dart';

import '../../../core/services/service_locator.dart';
import '../../controller/register/auth_event.dart';
import '../../controller/register/auth_state.dart';

import '../component/custom_main_page.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc,AuthState>(
          builder: (context, state) {
            return CustomMainPage(
              widget: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child:
                                Image(image: AssetImage('assets/icons/red.png'))),
                        SizedBox(
                          height: height * 0.12,
                        ),
                        Text(
                          'Logining',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black, fontSize: 30),
                        ),
                        Text(
                          'Enter Your email and password',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        defaultFormField(
                          controller: userNameController,
                          type: TextInputType.text,

                          label: 'User Name',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'userName must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'email',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'email must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.text,
                          suffixIcon: Icons.visibility,
                          sufixPressed: () {},
                          label: 'password',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        defaultButton(
                            function: () {
                             if(formKey.currentState!.validate()){
                               sl<AuthBloc>().add(SignUpEvent(
                                   email: emailController.text,
                                   password: passwordController.text,
                                    userName: userNameController.text));
                             }
                            },
                            text: 'Sign Up'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, LoginScreen());
                                },
                                child: Text('Sign In'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if(state.userSignUpState==RequestState.loaded){
              showToast(text: 'SignUp Successfully', state: ToastStates.SUCCESS);
              Navigator.pop(context);
            }

          }),
    );
  }
}
