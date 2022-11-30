import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        create: (context)=>sl<AuthBloc>()..add(GetUserDataEvent()),
      child: BlocConsumer<AuthBloc,AuthState>(
          builder: (context,state){
            return ScreenUtilInit(
              builder: (context,Widget? widget){
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                height: 70,
                                width:70,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(image: AssetImage(
                                      "assets/images/person.jpg",

                                    ),
                                    ),
                                    shape: BoxShape.circle
                                ),
                              ),
                                SizedBox(width: 20.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Ahmed M.Fadlallah",
                                      style:  Theme.of(context).textTheme.headline1!.copyWith(
                                        color: Colors.black,
                                        fontSize: 18,
                                        height: 1
                                    ),

                                    ),
                                    Text("ahmed@gmail.com",style:  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.grey,
                                        fontSize: 15
                                    ),),

                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          myDivider(),
                          buildItem(context, "assets/icons/Orders.png", "Orders"),
                          myDivider(),
                          buildItem(context, "assets/icons/details.png", "My Details"),
                          myDivider(),
                          buildItem(context, "assets/icons/address.png", "Delivery Address"),
                          myDivider(),
                          buildItem(context, "assets/icons/payment.png", "Payment Methods"),
                          myDivider(),
                          buildItem(context, "assets/icons/Promo.png", "Promo Card"),
                          myDivider(),
                          buildItem(context, "assets/icons/bell.png", "Notifications"),
                          myDivider(),
                          buildItem(context, "assets/icons/help.png", "Help"),
                          myDivider(),
                          buildItem(context, "assets/icons/info.png", "About"),
                          myDivider(),
                          logButton(function: (){
                            sl<AuthBloc>().add(LogoutEvent());
                          }, text: "Logout", icon: "assets/icons/logout.png")
                        ],
                      ),
                    ),
                  ),
                );
              },
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
  Widget buildItem(context,String icon,String text)=>Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      children: [
        Image.asset(icon),
        SizedBox(width: 20.w,),
        Text(text,
          style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Colors.black,
            fontSize: 18,


          ),),
        const Spacer(),
        IconButton(onPressed: (){}, icon: Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ))

      ],
    ),
  );
}
