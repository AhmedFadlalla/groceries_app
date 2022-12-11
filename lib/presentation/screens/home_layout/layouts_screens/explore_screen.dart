import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/counter/search_cubit.dart';
import '../../../controller/counter/search_state.dart';
import '../../component/compenent.dart';
import 'compenent/home_screen_compoenet/shared_component.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: defaultSearchField(
                      controller: searchController,
                      type: TextInputType.text,
                      // onChange: (value){
                      //   sl<SearchCubit>().getSearchProductData(name: value);
                      // },
                      label: "Search",
                      onsubmit: (value) {
                        cubit.getSearchProductData(name: value);
                      },
                      prefixIcon: const Image(
                          image: AssetImage("assets/icons/search-store.png")),
                      validator: (value) {}),
                ),
                if (state is GetSearchDataLoadingState)
                  const Center(child: CircularProgressIndicator()),
                if (state is GetSearchDataSuccessState)
                  if (cubit.searchProducts.isNotEmpty)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 9 / 11.5,
                            shrinkWrap: true,
                            children: List.generate(
                              SearchCubit.get(context).searchProducts.length,
                              (index) {
                                return buildCardItem(
                                    SearchCubit.get(context)
                                        .searchProducts[index],
                                    context);
                              },
                            )),
                      ),
                    ),
                if (cubit.searchProducts.isEmpty)
                  Center(
                    child: Lottie.asset("assets/lottie/empty.json"),
                  ),
              ],
            ),
          );
        },
        listener: (context, state) {
          print('stateeeeeeeeee $state');
        },
      ),
    );
  }
}
