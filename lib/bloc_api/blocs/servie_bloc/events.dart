import 'package:equatable/equatable.dart';

abstract class ServiceEvent extends Equatable{
}

class LoadServiceEvent extends ServiceEvent{
  @override
  List<Object?> get props => [];
}