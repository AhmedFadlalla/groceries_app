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

               ProductDetailsBody(id: id),
            ],
          ),
        ),
      ),
    );
  }
}
