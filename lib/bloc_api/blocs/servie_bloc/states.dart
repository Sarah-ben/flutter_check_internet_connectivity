import 'package:equatable/equatable.dart';

import '../../data/service.dart';

abstract class ServiceState extends Equatable{}

class ServiceLoadingState extends ServiceState{
  @override
  List<Object?> get props => [];
}
class ServiceLoadedState extends ServiceState{
  List<Datum> services;
  ServiceLoadedState({required this.services});
  @override
  List<Object?> get props => [services];
}
class ServiceErrorState extends ServiceState{
  String msg;
  ServiceErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];
}

