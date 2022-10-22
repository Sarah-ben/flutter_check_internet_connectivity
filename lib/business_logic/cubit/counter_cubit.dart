import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/business_logic/internet_cubit/internet_state.dart';
import 'package:untitled1/components/constants/enum.dart';

import '../internet_cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  //final InternetCubitCubit internetCubitCubit;
  //StreamSubscription? connectivityStreamSubscription;
  CounterCubit(//{required this.internetCubitCubit}
   )
      : super(CounterState(counterValue: 0, isIncremented: false)) ;
  /*{
    monitorInternetConnection();
  }*/
  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    addError(Exception('somthing went wrong'),StackTrace.current);
  return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }


/*  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }*/

 /* void monitorInternetConnection() {
    connectivityStreamSubscription =
        internetCubitCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }*/
}
