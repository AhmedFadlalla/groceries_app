import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_case/send_order_data_use_case.dart';
import 'order_event.dart';
import 'order_state.dart';


class OrderBloc extends Bloc<BaseOrderEvent, OrderState> {
  final SendOrderDataUseCase sendOrderDataUseCase;

  OrderBloc(this.sendOrderDataUseCase) : super(const OrderState()) {
    on<SendOrderDataEvent>((event, emit) async {
      final result = await sendOrderDataUseCase(
          OrderParameter(id: event.id,
              name: event.name,
              email: event.email,
              address: event.address,
              phone: event.phone,
              city: event.city,
              orderProducts: event.orderProducts,
              totalPrice:event.totalPrice)
      );
      result.fold((l) => emit(
        state.copyWith(
          orderDataState: RequestState.error,
          orderDataMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          orderData: r,orderDataState: RequestState.loaded
        )
      ));
    });
  }
}
