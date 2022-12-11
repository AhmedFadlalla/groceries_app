import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/utils/app_color.dart';
import 'package:grocery_app/presentation/controller/home/home_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_state.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/entities/base_product_data.dart';
import 'compenent/home_screen_compoenet/card_component.dart';
import 'compenent/home_screen_compoenet/categories_product_screen.dart';
import 'compenent/home_screen_compoenet/const_compenent.dart';
import 'compenent/home_screen_compoenet/groceries_list_component.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  var searchController=TextEditingController();
  
  // List<BaseProductData> exclusiveData=[
  //   const BaseProductData(
  //     id:0,
  //       image: "assets/images/bananna.png",
  //       name: "Organic Bananas",
  //       description: 7,
  //       price: 499),
  //   const BaseProductData(
  //       id:1,
  //       image: "assets/images/apple.png",
  //       name: "Red Apple",
  //       description: 1,
  //       price: 499),
  //   const BaseProductData(
  //     id:2,
  //       image: "assets/images/bananna.png",
  //       name: "Organic Bananas",
  //       description: 7,
  //       price: 496),
  // ];
  //  List<BaseProductData> bestSellingData=[
  //    const BaseProductData(
  //      id:0,
  //        image: "assets/images/felfel.png",
  //        name: "Red FelFel",
  //        description: 7,
  //        price: 499),
  //    const BaseProductData(
  //      id:1,
  //        image: "assets/images/potatos.png",
  //        name: "Botatos",
  //        description: 1,
  //        price: 499),
  //    const BaseProductData(
  //      id:2,
  //
  //        image: "assets/images/bananna.png",
  //        name: "Organic Bananas",
  //        description: 7,
  //        price: 496),
  //  ];
  //  List<BaseProductData> groceriesData=[
  //    const BaseProductData(
  //      id:0,
  //        image: "assets/images/poqoliat.png",
  //        name: "Pulses",
  //        description: 4,
  //        price: 0),
  //    const BaseProductData(
  //      id:1,
  //        image: "assets/images/rice.png",
  //        name: "Rice",
  //        description: 8,
  //        price: 0),
  //  ];
  //  List<Color> groceriesListColors=[
  //    Color(0xffF8A44C).withOpacity(0.13),
  //    Color(0xff53B175).withOpacity(0.15)
  //  ];
  //  List<BaseProductData> animalProducts=[
  //    const BaseProductData(
  //      id:0,
  //        image: "assets/images/meet.png",
  //        name: "Beef Bone",
  //        description: 1,
  //        price: 4),
  //    const BaseProductData(
  //      id: 1,
  //        image: "assets/images/chicken.png",
  //        name: "Broiler Chicken",
  //        description: 1,
  //        price: 4),
  //  ];
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return BlocProvider(create: (context)=>sl<HomeBloc>(),
    child: BlocConsumer<HomeBloc,HomeState>(builder: (context,state){
      return RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
        onRefresh: () async{
          return Future<void>.delayed(const Duration(seconds: 1));
        } ,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstComponent(),
                  SizedBox(height: height*0.03,),
                  Row(
                    children: [
                      Text("Exclusive Offer",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.black,
                            fontSize: 25
                        ),),
                      const Spacer(),
                      TextButton(
                          onPressed: (){
                            navigateTo(context, const CategoriesProductsScreen(id: 1,name: "Exclusive Offer",));
                          },
                          child: const Text(
                            "See all",
                            style: TextStyle(
                                color:  mainColor,
                                fontSize: 18
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  const CardComponent(
                    id: 1,
                  ),

                  SizedBox(height: height*0.02),
                  Row(
                    children: [
                      Text("Best Selling",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.black,
                            fontSize: 25
                        ),),
                      const Spacer(),
                      TextButton(
                          onPressed: (){
                            navigateTo(context, const CategoriesProductsScreen(id: 1,name: "Best Selling",));

                          },
                          child: const Text(
                            "See all",
                            style: TextStyle(
                                color:  mainColor,
                                fontSize: 18
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: height*0.02),
                  const CardComponent(id: 7,),
                  SizedBox(height: height*0.02),
                  Row(
                    children: [
                      Text("Groceries",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.black,
                            fontSize: 25
                        ),),
                      const Spacer(),
                      TextButton(
                          onPressed: (){
                            navigateTo(context, const CategoriesProductsScreen(id: 0,name: "All Products",));
                          },
                          child: const Text(
                            "See all",
                            style: TextStyle(
                                color:  mainColor,
                                fontSize: 18
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: height*0.02),
                  const GroceriesListComponent(),
                  SizedBox(height: height*0.02),
                  const CardComponent(id: 9)

                ],

              ),
            ),
          ),
        ),
      );
    }, listener: (context,state){}),);
  }
}
