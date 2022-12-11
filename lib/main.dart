import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/core/services/cach_helper.dart';
import 'package:grocery_app/core/services/dio_helper.dart';
import 'package:grocery_app/core/utils/app_color.dart';
import 'package:grocery_app/presentation/screens/home_layout/home_layout.dart';
import 'package:grocery_app/presentation/screens/register/login.dart';
import 'package:grocery_app/presentation/screens/splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'core/services/service_locator.dart';
import 'core/utils/constrant.dart';
import 'core/utils/observer.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CachHelper.init();
  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  uId=CachHelper.getData(key: "uId");
  Widget? widget;
  if(uId !=null){
    widget=const HomeLayout();
  }else{
    widget=const SplashBodyView();
  }
  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

   MyApp({super.key , required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightScaffoldColor,
        fontFamily: GoogleFonts.poppins(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ).fontFamily,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 45
          ),
          caption: TextStyle(
            fontSize: 17,
            color: lightScaffoldColor,
            fontWeight: FontWeight.w400

          ),
          bodyText1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            height: 25
          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: mainColor,
          unselectedItemColor: darkThemeColor,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(
            color: mainColor,

          )
        ),
        appBarTheme:  AppBarTheme(
          backgroundColor: lightScaffoldColor,

        )
      ),
      home: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context,snapshot){
          switch(snapshot.data){
            case ConnectivityResult.bluetooth:
              return startWidget;
            case ConnectivityResult.wifi:
              return startWidget;
            case ConnectivityResult.ethernet:
              return startWidget;
            case ConnectivityResult.mobile:
              return startWidget;
            case ConnectivityResult.none:
              return Scaffold(
                body: Center(
                  child: Lottie.asset("assets/lottie/wifi.json"),
                ),
              );
            case ConnectivityResult.vpn:
              return startWidget;
            default:
              return startWidget;
          }
        },
      ),
    );
  }
}


