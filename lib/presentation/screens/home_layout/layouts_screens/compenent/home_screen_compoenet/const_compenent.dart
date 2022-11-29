import 'package:flutter/material.dart';

import '../../../../component/compenent.dart';
class ConstComponent extends StatelessWidget {
   ConstComponent({Key? key}) : super(key: key);
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Column(
      children: [
        const  Center(child:  Image(
          image: AssetImage('assets/icons/red.png'),
          width: 28,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("assets/icons/location.png")),
            SizedBox(width: 8,),
            Text(
              "Dhaka,Banassre",
            ),

          ],
        ),
        SizedBox(height: height*0.02,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: defaultSearchField(
              controller: searchController,
              type: TextInputType.text,
              prefixIcon: const Image(image: AssetImage("assets/icons/search-store.png")),
              validator: (value){

              }),
        ),
        Container(
          width: double.infinity,
          height: 115,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image:const DecorationImage(image:AssetImage('assets/images/banner.jpg') )
          ),

        ),
      ],
    );
  }
}
