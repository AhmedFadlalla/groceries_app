import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';
import 'package:grocery_app/presentation/controller/home/home_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_event.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/enum.dart';
import '../../../controller/home/home_state.dart';
import '../../component/compenent.dart';
import 'compenent/home_screen_compoenet/shared_component.dart';
class ExploreScreen extends StatelessWidget {
   ExploreScreen({Key? key}) : super(key: key);
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>sl<HomeBloc>(),
        child:BlocBuilder<HomeBloc,HomeState>(
          builder: (context,state){
            print(state.searchProductsDataState);
            switch(state.searchProductsDataState){
              case RequestState.loading:
                print("Loading${state.searchProductsData}");
                return SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: defaultSearchField(
                            controller: searchController,
                            type: TextInputType.text,
                            onChange: (value){
                              if(value.length<3){
                                showToast(text: "Must be 3 character", state: ToastStates.SUCCESS);
                              }else{
                                sl<HomeBloc>().add(SearchProductByNameEvent(name: value));
                              }

                            },
                            onsubmit: (value){
                              if(value.length<3){
                                showToast(text: "Must be 3 character", state: ToastStates.SUCCESS);
                              }else{
                                sl<HomeBloc>().add(SearchProductByNameEvent(name: value));
                              }

                            },

                            prefixIcon: const Image(image: AssetImage("assets/icons/search-store.png")),
                            validator: (value){


                            }),
                      ),
                      Center(
                        child: Lottie.asset("assets/lottie/empty.json"),
                      ),
                    ],
                  ),
                );
              case RequestState.loaded:
                print("Success${state.searchProductsData}");
                return SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: defaultSearchField(
                            controller: searchController,
                            type: TextInputType.text,
                            onChange: (value){
                              sl<HomeBloc>().add(SearchProductByNameEvent(name: value));
                            },
                            // onsubmit: (value){
                            //   sl<HomeBloc>().add(SearchProductByNameEvent(name: value));
                            // },
                            prefixIcon: const Image(image: AssetImage("assets/icons/search-store.png")),
                            validator: (value){

                            }),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(

                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 20.0,
                              childAspectRatio: 9/11.5,
                              shrinkWrap: true,
                              children:  List.generate(state.searchProductsData.length,
                                    (index) {
                                  return buildCardItem(state.searchProductsData[index],
                                      context);
                                } ,)),
                        ),
                      ),
                    ],
                  ),
                );
              case RequestState.error:
                return Center(child: Text(state.searchProductsDataMessage),);
            }

          },


        ),
    );
  }
}
