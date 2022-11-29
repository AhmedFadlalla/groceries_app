import 'package:flutter/material.dart';
import 'package:grocery_app/core/utils/app_color.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:grocery_app/presentation/screens/register/login.dart';

class LocationScreen extends StatelessWidget {
   LocationScreen({Key? key}) : super(key: key);

  var zonesController=TextEditingController();
   var areasController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/map.png')),
              Text(
                'Select Your Location',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontSize: 26),
              ),
              Text(
                'Switch on your location to stay in tune with what\'s happening in your area',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.grey, fontSize: 8),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              defaultFormField(
                  controller: zonesController,
                  type: TextInputType.text,
                  label: 'Zones',
                  validator: (value){
                    if(value.isEmpty){
                      return 'zones must not be empty';
                    }
                    return null;
                  },
                   ),
              SizedBox(
                height: height * 0.02,
              ),
              defaultFormField(
                controller: areasController,
                type: TextInputType.text,
                label: 'Area',
                validator: (value){
                  if(value.isEmpty){
                    return 'zones must not be empty';
                  }
                  return null;
                },
              ),
              defaultButton(function: (){
                navigateTo(context, LoginScreen());
              }, text: 'Submit')


            ],
          ),
        ),
      ),
    );
  }
}
