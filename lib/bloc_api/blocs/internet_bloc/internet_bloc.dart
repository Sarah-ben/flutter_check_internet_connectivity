import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc_api/blocs/internet_bloc/internet_event.dart';
import 'package:untitled1/bloc_api/blocs/internet_bloc/internet_states.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  StreamSubscription? subscription;
  InternetBloc():super(InitState()){
    on<OnConnected>((event, emit) {
      emit(ConnectedState('online'));
    });
    on<OnDisconnected>((event, emit) {
      emit(ConnectedState('offline'));
    });
subscription=Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
if(result ==ConnectivityResult.wifi ||result ==ConnectivityResult.mobile){
  add(OnConnected());
}else {
  add(OnDisconnected());
}
});
  }
@override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}