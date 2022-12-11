import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/utils/enum.dart';

import '../../../domain/entities/base_cart_product_data.dart';
import '../../../domain/entities/base_product_data.dart';

class CartState extends Equatable{
  final RequestState? addProductToCartState;
  final String addProductToCartMessage;
  final List<BaseCartProductData> cartProducts;
  final RequestState cartProductsState;
  final String cartProductsMessage;
  final int count;
  final RequestState increaseCounterState;



  const CartState({
    this.addProductToCartState,
    this.addProductToCartMessage='',
    this.cartProducts=const [],
    this.cartProductsState=RequestState.loading,
    this.cartProductsMessage='',
    this.count=1,
    this.increaseCounterState=RequestState.loading
  });

  CartState copyWith({
  RequestState? addProductToCartState,
    String? addProductToCartMessage,
     List<BaseCartProductData>? cartProducts,
     RequestState? cartProductsState,
     String? cartProductsMessage,
    int? count,
    RequestState? increaseCounterState
})=>CartState(
    addProductToCartState: addProductToCartState??this.addProductToCartState,
    addProductToCartMessage: addProductToCartMessage??this.addProductToCartMessage,
    cartProducts: cartProducts??this.cartProducts,
    cartProductsState: cartProductsState??this.cartProductsState,
    cartProductsMessage: cartProductsMessage??this.cartProductsMessage,
    count: count??this.count,
    increaseCounterState: increaseCounterState??this.increaseCounterState
  );


  @override
  List<Object?> get props => [
    addProductToCartState,addProductToCartMessage,
    cartProducts,cartProductsState,cartProductsMessage,
    count,increaseCounterState
  ];
}
