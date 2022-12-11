import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/domain/entities/base_cart_product_data.dart';
import 'package:grocery_app/presentation/controller/cart/cart_event.dart';
import 'package:grocery_app/presentation/controller/cart/cart_state.dart';
import 'package:grocery_app/presentation/controller/order/order_event.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/services/cach_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../controller/cart/cart_bloc.dart';
import '../../../controller/order/order_bloc.dart';
import '../../../controller/order/order_state.dart';
import '../../register/login.dart';
import 'compenent/product_details_component/counter_component.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<CartBloc>()
        ..add(GetProductsFromCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
          builder: (context, state) {
            switch (state.cartProductsState) {
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.loaded:
                var products = state.cartProducts;
                if (products.isEmpty) {
                  return Center(
                    child: Lottie.asset("assets/lottie/empty.json"),
                  );
                } else {
                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                    systemNavigationBarColor: Colors.grey[200],
                    systemNavigationBarIconBrightness: Brightness.dark,
                    systemNavigationBarDividerColor: Colors.black,
                  ));
                  return ScreenUtilInit(
                    builder: (BuildContext context, Widget? child) {
                      return SafeArea(
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                                  "My Cart",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                      color: Colors.black, fontSize: 31.sp),
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            myDivider(),
                            Expanded(
                              child: Container(
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        buildCartItem(products[index], context),
                                    separatorBuilder: (context, index) =>
                                        myDivider(),
                                    itemCount: products.length),
                              ),
                            ),
                            defaultButton(
                                function: () {
                                  var nameController = TextEditingController();
                                  var emailController = TextEditingController();
                                  var addressController =
                                  TextEditingController();
                                  var cityController = TextEditingController();
                                  var phoneController = TextEditingController();
                                  var formKey=GlobalKey<FormState>();
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: !true,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          child: BlocProvider(
                                            create: (BuildContext context) =>
                                                sl<OrderBloc>(),
                                            child: BlocConsumer<OrderBloc,
                                                OrderState>(
                                              listener: (context, state) {
                                                if(state.orderData!=null)
                                                  {
                                                    showToast(text: "Order Submit Successfully", state: ToastStates.SUCCESS);
                                                  }
                                              },
                                              builder: (context, state) {
                                                return Form(
                                                  key: formKey,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        15.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        // SizedBox(height: 500,),
                                                        Center(
                                                            child: Text(
                                                              "Final Form",
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18),
                                                            )),
                                                        defaultFormField(
                                                            controller:
                                                            nameController,
                                                            type: TextInputType
                                                                .text,
                                                            label: "Name",
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return 'Name Must not be empty';
                                                              }
                                                              return null;
                                                            }),
                                                        SizedBox(
                                                          height: 12.h,
                                                        ),
                                                        defaultFormField(
                                                            controller:
                                                            emailController,
                                                            type: TextInputType
                                                                .text,
                                                            label: "Email",
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return 'Email Must not be empty';
                                                              }
                                                              return null;
                                                            }),
                                                        SizedBox(
                                                          height: 12.h,
                                                        ),
                                                        defaultFormField(
                                                            controller:
                                                            phoneController,
                                                            type: TextInputType
                                                                .text,
                                                            label: "Phone",
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return 'Phone Must not be empty';
                                                              }
                                                              return null;
                                                            }),
                                                        SizedBox(
                                                          height: 12.h,
                                                        ),
                                                        defaultFormField(
                                                            controller:
                                                            addressController,
                                                            type: TextInputType
                                                                .text,
                                                            label: "Address",
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return 'Address Must not be empty';
                                                              }
                                                              return null;
                                                            }),
                                                        SizedBox(
                                                          height: 12.h,
                                                        ),
                                                        defaultFormField(
                                                            controller:
                                                            cityController,
                                                            type: TextInputType
                                                                .text,
                                                            label: "City",
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return 'City Must not be empty';
                                                              }
                                                              return null;
                                                            }),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        defaultButton(
                                                            function: () {
                                                             if(formKey.currentState!.validate()){
                                                               sl<OrderBloc>().add(
                                                                   SendOrderDataEvent(
                                                                       id: 0,
                                                                       name: nameController.text,
                                                                       email: emailController.text,
                                                                       address: addressController.text,
                                                                       phone: phoneController.text,
                                                                       city: cityController.text,
                                                                       orderProducts: const [],
                                                                       totalPrice: 250));
                                                             }
                                                            },
                                                            text: "Submit")
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
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
                return Center(
                  child: Text(state.cartProductsMessage),
                );
            }
          },
          listener: (context, state) {
            if(state.cartProductsState == RequestState.error){
              CachHelper.removeData(key: "uId").then((value) {
                navigateAndFinish(context, LoginScreen());
              });
            }
          }),
    );
  }

  Widget buildCartItem(BaseCartProductData data, context) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 70.71,
                  height: 64.11,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/felfel.png"))),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    data.name,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16.sp, color: Colors.black),
                  ),
                  Text(
                    "${data.quantity}kg,Price",
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.grey, fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CounterComponent(price: data.price, visiable: true),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {}, icon: Image.asset("assets/icons/exit.png")),
            ],
          ),
        ),
      );
}
