import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:grocery_app/presentation/screens/verify_code_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneScreen extends StatelessWidget {
   PhoneScreen({Key? key}) : super(key: key);

  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top
    ]);
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_ios_new),
              SizedBox(height: height*0.1,),
              Text(
                  'Enter Your mobile Number',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: Colors.black,
                  fontSize: 25
                ),
              ),
              SizedBox(height: height*0.05,),
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                controller: phoneController,
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                onSubmitted: (phone){

                },
                onTap: (){

                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateTo(context,  VerifyCodeScreen());
          },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
