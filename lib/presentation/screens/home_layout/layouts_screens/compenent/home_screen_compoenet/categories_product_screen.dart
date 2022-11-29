import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/presentation/controller/home/home_event.dart';
import 'package:grocery_app/presentation/controller/home/home_state.dart';
import 'package:grocery_app/presentation/screens/home_layout/layouts_screens/compenent/home_screen_compoenet/shared_component.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../../core/services/service_locator.dart';
import '../../../../../../core/utils/enum.dart';
import '../../../../../controller/home/home_bloc.dart';

class CategoriesProductsScreen extends StatelessWidget {
  final String name;
  final int id;
  const CategoriesProductsScreen({Key? key,required this.id,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<HomeBloc>()..add(GetProductsDataByCategoryEvent(id: id)),
      child: BlocConsumer<HomeBloc,HomeState>(builder: (context,state){
        switch(state.productsDataState){
          case RequestState.loading:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return ScreenUtilInit(
              builder: (context,Widget? child){
                return Scaffold(
                  appBar: AppBar(
                    title:  Center(
                      child: Text(
                        name,
                        style:const TextStyle(
                            color: Colors.black
                        ),
                      ),
                    ),
                    actions: [
                      IconButton(onPressed: (){
                        SlidingUpPanel(
                          maxHeight: 80.h,
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8)),
                          panel: Center(child: Text("This is the sliding Widget"),),
                          parallaxEnabled: true,
                          body: Column(
                            children: [
                              Center(child: Text("ahmed"),)
                            ],
                          ),
                        );
                      }, icon:const Image(image: AssetImage("assets/icons/cart.png")))
                    ],
                  ),
                  body: SafeArea(child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 9/11,
                        shrinkWrap: true,
                        children:  List.generate(state.productsData.length,
                              (index) {
                            return buildCardItem(state.productsData[index], context);
                          } ,)),
                  )),
                );
              },
            );
          case RequestState.error:
            return Scaffold(
              body: Center(child: Text(state.productsDataMessage)),
            );
        }
      }, listener: (context,state){

      }),
    );
  }
}
