import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/presentation/screens/auth_screen.dart';

import 'component/compenent.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/man.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Image(
                image: AssetImage('assets/icons/Group.png'),
                width: 70,
                height: 70,
              ),
              Text(
                'Welcome \n to our store',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Get your groceries in as fast as one hour',
                style: Theme.of(context).textTheme.caption,
              ),
              defaultButton(function: (){
                navigateTo(context, const AuthScreen());
              }, text: 'Get Started')
            ],
          )
        ],
      ),
    );
  }
}
