import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/base_cart_product_data.dart';
import '../../../domain/use_case/add_product_to_cart_use_case.dart';
import '../../../domain/use_case/get_products_from_cart_use_case.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<BaseCartEvent, CartState> {
  final AddProductToCartUseCase addProductToCartUseCase;
  final GetProductsFromCartUseCase getProductsFromCartUseCase;


  CartBloc(this.addProductToCartUseCase,
      this.getProductsFromCartUseCase) :
        super(const CartState()) {
    on<AddProductToCartEvent>((event, emit) async {
      emit(
        state.copyWith(
          addProductToCartState: RequestState.loading
        )
      );
      await addProductToCartUseCase(
          StatusParameter(id: event.id))
          .then((value) {
        emit(
            state.copyWith(
                addProductToCartState: RequestState.loaded
            )
        );
        showToast(text: "Added Successfully", state: ToastStates.SUCCESS);
      }).catchError((error){
        emit(
            state.copyWith(
                addProductToCartState: RequestState.error,
                addProductToCartMessage: error.toString()
            ));
            });


    });
    on<GetProductsFromCartEvent>((event, emit) async {
      final result = await getProductsFromCartUseCase(const NoParameters())
          .then((value) {
        emit(
            state.copyWith(
                cartProducts: value.fold((l) => null, (r) {
                  return r;
                }),
                cartProductsState: RequestState.loaded
            )
        );
      }).catchError((error){
        emit(
            state.copyWith(
                cartProductsMessage: error.toString(),
                cartProductsState: RequestState.error
            )
        );
      });
      print(result);
    });
    on<IncreaseCountEvent>((event, emit) {
      print(state.count);
      emit(
          state.copyWith(
              count: state.count + 1,
              increaseCounterState: RequestState.loaded
          )
      );
    });
  }
}
