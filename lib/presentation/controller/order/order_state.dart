import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/utils/enum.dart';

import '../../../domain/entities/base_order_data.dart';

class OrderState extends Equatable {
  final BaseOrderData? orderData;
  final RequestState orderDataState;
  final String orderDataMessage;

 const  OrderState({
    this.orderData,
    this.orderDataState=RequestState.loading,
    this.orderDataMessage='',
  });

  OrderState copyWith({
  BaseOrderData? orderData,
    RequestState? orderDataState,
    String? orderDataMessage
})=>OrderState(
orderData: orderData??this.orderData,
    orderDataState: orderDataState??this.orderDataState,
    orderDataMessage: orderDataMessage??this.orderDataMessage
);
  @override
  List<Object?> get props => [orderData, orderDataState, orderDataMessage];
}
