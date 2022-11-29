import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/domain/entities/base_category_data.dart';
import 'package:grocery_app/presentation/controller/home/home_event.dart';
import 'package:grocery_app/presentation/controller/home/home_state.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';

import '../../../../../../core/services/service_locator.dart';
import '../../../../../../domain/entities/base_product_data.dart';

import 'package:flutter/material.dart';

import '../../../../../controller/home/home_bloc.dart';
import 'categories_product_screen.dart';
class GroceriesListComponent extends StatelessWidget {

  const   GroceriesListComponent({
     Key? key,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context)=>sl<HomeBloc>()..add(GetCategoriesEvent()),
      child: BlocConsumer<HomeBloc,HomeState>(builder: (context,state){
        return SizedBox(
          height: 105,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  buildGroceriesCard(state.categoriesData[index],context) ,
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              itemCount: state.categoriesData.length),
        );
      }, listener: (context,state){}),);
  }
  Widget buildGroceriesCard(BaseCategoryData data,context)=> InkWell(
    onTap: (){
      navigateTo(context, CategoriesProductsScreen(id: data.id,name: data.name,));
    },
    child: Container(
      width: 248.19,
      height: 105,
      decoration:  BoxDecoration(
          color:  const Color(0xffF8A44C).withOpacity(0.13),
          borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Container(
            //   width: 71.9,
            //   height: 71.9,
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(image: AssetImage(data.image))),
            // ),
            const  SizedBox(width: 5,),
            Text(data.name,
              style: const  TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),)
          ],
        ),
      ),
    ),
  );
}
