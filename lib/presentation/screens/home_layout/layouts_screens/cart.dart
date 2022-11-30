import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/domain/entities/base_cart_product_data.dart';
import 'package:grocery_app/presentation/controller/cart/cart_event.dart';
import 'package:grocery_app/presentation/controller/cart/cart_state.dart';
import 'package:grocery_app/presentation/controller/home/home_state.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../controller/cart/cart_bloc.dart';
import '../../../controller/home/home_bloc.dart';
import 'compenent/product_details_component/counter_component.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartBloc>()..add(GetProductsFromCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
          builder: (context, state) {
            switch(state.cartProductsState){
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.loaded:
                var products=state.cartProducts;
                if(products.isEmpty){
                  return Center(child:Lottie.asset("assets/lottie/empty.json"),);
                }else{
                  return ScreenUtilInit(
                    builder: (BuildContext context, Widget? child) {
                      return SafeArea(
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                                  "My Cart",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.black, fontSize: 31.sp),
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            myDivider(),
                            Expanded(
                              child: Container(
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>buildCartItem(products[index], context),
                                    separatorBuilder: (context, index) => myDivider(),
                                    itemCount: products.length),
                              ),
                            ),
                            defaultButton(
                                function: () {
                                  Scaffold.of(context)
                                      .showBottomSheet<void>(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                                      ),
                                          (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          color: Colors.amber,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                const Text('BottomSheet'),
                                                ElevatedButton(
                                                  child: const Text('Close BottomSheet'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                text: "Go to checkout"),
                          ],
                        ),
                      );
                    },
                  );
                }
              case RequestState.error:
                return Center(child: Text(state.cartProductsMessage),);
            }
          },
          listener: (context, state) {}),
    );
  }

  Widget buildCartItem(BaseCartProductData data,context)=> Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 70.71,
              height: 64.11,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/felfel.png"))),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                data.name,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(
                    fontSize: 16.sp,
                    color: Colors.black),
              ),
              Text(
                "${data.quantity}kg,Price",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(
                    color: Colors.grey,
                    fontSize: 13.sp),
              ),
              SizedBox(height: 15.h,),
              CounterComponent(price: data.price, visiable: true),
            ],
          ),

          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                  "assets/icons/exit.png")),

        ],
      ),
    ),
  );
}
