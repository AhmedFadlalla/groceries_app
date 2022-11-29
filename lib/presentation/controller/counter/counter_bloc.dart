import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
enum CounterEvent { increment, decrement, init }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(1);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event == CounterEvent.increment) {
      yield state + 1;
    } else if (event == CounterEvent.decrement) {
      yield state - 1;
    } else if (event == CounterEvent.init) {
      yield 1;
    }
  }
}
