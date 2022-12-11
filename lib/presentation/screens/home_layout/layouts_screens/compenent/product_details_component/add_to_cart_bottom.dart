import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/services/service_locator.dart';
import '../../../../../controller/cart/cart_bloc.dart';

import 'package:flutter/material.dart';

import '../../../../../controller/cart/cart_event.dart';
import '../../../../../controller/cart/cart_state.dart';
import '../../../../component/compenent.dart';
class AddToCartBottom extends StatelessWidget {
  final int id;
  const AddToCartBottom({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>sl<CartBloc>(),
      child: BlocConsumer<CartBloc,CartState>(
        builder: (context,state){
          print(id);
          switch(state.cartProductsState){
            case RequestState.loading:
               return defaultButton(function: (){
                sl<CartBloc>().add(AddProductToCartEvent(id));
              }, text: "Add To Basket");
            case RequestState.loaded:
              return Lottie.asset("assets/lottie/added.json");
            case RequestState.error:
              return Text(state.cartProductsMessage);
          }



        },
        listener: (context,state){
        },
      )
    );
  }
}
