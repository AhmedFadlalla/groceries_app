import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/enum.dart';
import '../../../domain/use_case/get_categories_data_use_case.dart';
import '../../../domain/use_case/get_product_details_data_use_case.dart';
import '../../../domain/use_case/get_products_data_by_category_use_case.dart';
import '../../../domain/use_case/search_product_by_name_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<BaseHomeEvent, HomeState> {

  final GetCategoriesDataUseCase getCategoriesDataUseCase;
  final GetProductsDataByCategoryUseCase getProductsDataByCategoryUseCase;
  final GetProductDetailsDataUseCase getProductDetailsDataUseCase;
  final SearchProductByNameUseCase searchProductByNameUseCase;
  HomeBloc(this.getCategoriesDataUseCase,
      this.getProductsDataByCategoryUseCase,
      this.getProductDetailsDataUseCase,
      this.searchProductByNameUseCase) : super(const HomeState()) {
    on<GetCategoriesEvent>((event, emit) async{
      final result=await getCategoriesDataUseCase(const NoParameters());
      result.fold((l) => emit(
        state.copyWith(
          categoriesDataState: RequestState.error,
          categoriesDataMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          categoriesData: r,
          categoriesDataState: RequestState.loaded
        )
      ));

    });
    on<GetProductsDataByCategoryEvent>((event, emit) async{
      final result=await getProductsDataByCategoryUseCase(StatusParameter(id: event.id));
      result.fold((l) => emit(
          state.copyWith(
              productsDataState: RequestState.error,
              productsDataMessage: l.message
          )
      ), (r) => emit(
          state.copyWith(
              productsData: r,
              productsDataState: RequestState.loaded
          )
      ));

    });
    on<GetProductDetailsDataEvent>((event, emit) async{
      final result=await getProductDetailsDataUseCase(StatusParameter(id: event.id));
      result.fold((l) => emit(
          state.copyWith(
              productDetailsState: RequestState.error,
              productDetailsMessage: l.message
          )
      ), (r) => emit(
          state.copyWith(
              productDetailsData: r,
              productDetailsState: RequestState.loaded
          )
      ));
    });
    on<SearchProductByNameEvent>((event, emit) async {
      final result=await searchProductByNameUseCase(SearchStatus(name: event.name));
      print(result);
      result.fold((l) => emit(
          state.copyWith(
              searchProductsDataState: RequestState.error,
              searchProductsDataMessage: l.message
          )
      ), (r) {

        emit(
            state.copyWith(
                searchProductsDataState: RequestState.loaded,
                searchProductsData: r
            )
        );

       }
      );
      print(state.searchProductsDataState);
    });


  }
}
