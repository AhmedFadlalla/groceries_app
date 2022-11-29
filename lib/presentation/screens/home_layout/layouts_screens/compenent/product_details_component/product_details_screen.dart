import 'package:flutter/material.dart';
import 'package:grocery_app/presentation/screens/home_layout/layouts_screens/compenent/product_details_component/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;

  const ProductDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 413.6,
                    height: 371.44,
                    decoration: const BoxDecoration(
                      color: Color(0xffF2F3F2),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/bigapp.png",

                          ),
                        fit: BoxFit.fitWidth
                      )
                    ),

                  ),
                  Positioned(child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon:const  Icon(Icons.arrow_back_ios_new_rounded))),
                  Positioned(
                    right: 0,
                      child: IconButton(onPressed: (){
                  },
                          icon:const  Image(image: AssetImage("assets/icons/up.png"))))

                ],
              ),
               ProductDetailsBody(id: id),
            ],
          ),
        ),
      ),
    );
  }
}
