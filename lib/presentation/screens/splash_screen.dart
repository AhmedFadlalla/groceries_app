
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/presentation/screens/on_boarding_screen.dart';
import 'package:grocery_app/presentation/screens/register/login.dart';

import '../../core/utils/app_color.dart';
class SplashBodyView extends StatefulWidget {
  const SplashBodyView({Key? key}) : super(key: key);

  @override
  _SplashBodyViewState createState() => _SplashBodyViewState();
}

class _SplashBodyViewState extends State<SplashBodyView> with SingleTickerProviderStateMixin{
  AnimationController? animationController;
  Animation<double>? feedingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom
    ]);     animationController=AnimationController(vsync:this,duration: const Duration(milliseconds: 600) );
    feedingAnimation =Tween<double>(begin: 0.2,end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: mainColor,
      body: Center(
        child: FadeTransition(
          opacity: feedingAnimation!,
          child:  IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage('assets/icons/Group.png'),
                  width: 70,
                  height: 70,
                ),
                SizedBox(width: 8,),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'nectar',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color:lightScaffoldColor,
                        fontSize: 40,
                        // height: 0.1,
                      ),
                    ),
                    Text(
                      'online groceriet',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color:lightScaffoldColor,
                          fontSize: 17,
                        height: 0.1
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToNextView() {

    Future.delayed(const Duration(seconds: 3),()
    {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>const OnBoardingScreen()
          )
      );
    });
  }
}
