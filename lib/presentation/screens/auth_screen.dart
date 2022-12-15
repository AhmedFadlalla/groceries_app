import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:grocery_app/presentation/screens/phone_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom
    ]);
    return ScreenUtilInit(builder: (context,Widget? widget){
      return Scaffold(
        body: Column(
          children: [
            Expanded(child: Image(image: AssetImage('assets/images/groc.png'))),
            Expanded(
              child:Column(
                children: [
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    onTap: (){
                      navigateTo(context,  PhoneScreen());
                    },
                    keyboardType: TextInputType.none,
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                    },
                  ),
                  Text(
                    "Or connected with social media",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.grey,
                        fontSize: 12.sp
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  defaultAuthButton(
                      function: (){},
                      color: Color(0xff5383EC),
                      text: 'Continue with Google',
                      image: 'assets/images/google.png'),
                  defaultAuthButton(
                      function: (){},
                      color: Color(0xff4A66AC),
                      text: 'Continue with Facebook',
                      image: 'assets/images/facebook.png'),
                ],
              ),)
          ],

        ),
      );
    });
  }
}
