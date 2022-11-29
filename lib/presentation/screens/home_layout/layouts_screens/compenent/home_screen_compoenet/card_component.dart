import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_event.dart';
import 'package:grocery_app/presentation/controller/home/home_state.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:grocery_app/presentation/screens/home_layout/layouts_screens/compenent/home_screen_compoenet/shared_component.dart';

import '../../../../../../core/services/service_locator.dart';
import '../../../../../../core/utils/enum.dart';
import '../../../../../../domain/entities/base_product_data.dart';
import '../product_details_component/product_details_screen.dart';

class CardComponent extends StatelessWidget {
final int id;
  const CardComponent({
    Key? key,
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>sl<HomeBloc>()..add( GetProductsDataByCategoryEvent(id:id)),
      child: BlocConsumer<HomeBloc,HomeState>(
        builder: (context,state){
          switch(state.productsDataState){
            case RequestState.loading:
              return const Center(child:  CircularProgressIndicator(),);
            case RequestState.loaded:
              var products=state.productsData;
              return  Container(
                height: 248.51,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        buildCardItem(products[index], context),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                    itemCount: products.length),
              );
            case RequestState.error:
             return Center(child: Text(state.productsDataMessage),);
          }
        },
        listener: (context,state){

        },
      ),
    );
  }


}
