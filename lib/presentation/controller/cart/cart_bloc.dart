import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_case/add_product_to_cart_use_case.dart';
import '../../../domain/use_case/get_products_from_cart_use_case.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<BaseCartEvent, CartState> {
  final AddProductToCartUseCase addProductToCartUseCase;
  final GetProductsFromCartUseCase getProductsFromCartUseCase;


  CartBloc(
      this.addProductToCartUseCase,
      this.getProductsFromCartUseCase) :
        super(const CartState()) {
    on<AddProductToCartEvent>((event, emit) async{
      final result=await addProductToCartUseCase(StatusParameter(id: event.id));

      result.fold((l) => emit(
        state.copyWith(
          addProductToCartState: RequestState.error,
          addProductToCartMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          addProductToCartState: RequestState.loaded
        )
      ));
    });
    on<GetProductsFromCartEvent>((event, emit) async{
      final result=await getProductsFromCartUseCase(const NoParameters());
      print(result);
      result.fold((l) => emit(
          state.copyWith(
              cartProductsState: RequestState.error,
              cartProductsMessage: l.message
          )
      ), (r) => emit(
          state.copyWith(
              cartProductsState: RequestState.loaded,
            cartProducts: r
          )
      ));
    });
    on<IncreaseCountEvent>((event, emit) {
      print(state.count);
      emit(
        state.copyWith(
          count: state.count+1,
          increaseCounterState: RequestState.loaded
        )
      );
    });
  }
}
