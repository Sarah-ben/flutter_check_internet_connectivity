import 'package:equatable/equatable.dart';

abstract class CountState extends Equatable{}
class InitialState extends CountState{
  int init=0;
  InitialState({required this.init});

  @override
  List<Object?> get props => [init];


}

class IncrementState extends CountState{
  int counter;
  IncrementState({required this.counter});
  @override
  List<Object?> get props => [counter];

}
class DecrementState extends CountState{
  int counter;
  DecrementState({required this.counter});

  @override
  List<Object?> get props => [counter];
}
