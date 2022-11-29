import 'package:flutter/material.dart';
import 'package:grocery_app/core/utils/app_color.dart';

import 'layouts_screens/account_screen.dart';
import 'layouts_screens/cart.dart';
import 'layouts_screens/explore_screen.dart';
import 'layouts_screens/favourite_screen.dart';
import 'layouts_screens/home_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
  List<Widget> screens=[
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Image(image:
            AssetImage('assets/icons/home.png'),
              color: currentIndex==0?mainColor:darkThemeColor,
            ),label: "Home"),
            BottomNavigationBarItem(icon: Image(
                image: AssetImage('assets/icons/search.png'),
              color: currentIndex==1?mainColor:darkThemeColor,
            ),label: "Explore"),
            BottomNavigationBarItem(icon: Image(
                image: AssetImage('assets/icons/cart.png'),
              color: currentIndex==2?mainColor:darkThemeColor,
            ),label: "Cart"),
            BottomNavigationBarItem(icon: Image(
                image: AssetImage('assets/icons/fav.png'),
              color: currentIndex==3?mainColor:darkThemeColor,
            ),label: "Favourite"),
            BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/icons/profile.png'),
                  color: currentIndex==4?mainColor:darkThemeColor,
                ),label: "Account"),

          ],
        currentIndex: currentIndex,
        onTap: (index){
            setState(() {
              currentIndex=index;
            });
        },
      ),
    );
  }
}
