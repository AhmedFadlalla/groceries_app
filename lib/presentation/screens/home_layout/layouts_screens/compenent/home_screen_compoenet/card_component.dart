import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/presentation/controller/home/home_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_event.dart';
import 'package:grocery_app/presentation/controller/home/home_state.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:grocery_app/presentation/screens/home_layout/layouts_screens/compenent/home_screen_compoenet/shared_component.dart';
import 'package:shimmer/shimmer.dart';

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
              var products=state.productsData;
              return ScreenUtilInit(
                builder: (BuildContext context, Widget? child)=>Container(
                  height: 248.51.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ScreenUtilInit(
                            builder: (BuildContext context, Widget? child) =>Container(
                              height: 248.51.h,
                              width: 173.32.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(width: 1, color: Colors.grey.shade400)),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[400]!,
                                highlightColor: Colors.grey[300]!,
                                child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Container(
                                          width: 150.71,
                                          height: 80.11,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400]
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        width: 60.h,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey[400]
                                        ),

                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        width: 60.h,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey[400]
                                        ),

                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Container(
                                            width: 60.h,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.grey[400]
                                            ),

                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 45.67,
                                            width: 45.67,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Colors.grey[400]),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                      itemCount: 6),
                ),

              );
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
