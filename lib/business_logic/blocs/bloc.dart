import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/business_logic/blocs/states.dart';

import 'events.dart';

class CounterBloc extends Bloc<CountEvents,CountState>{
  CounterBloc(CountState initialState): super(initialState);

  int counter=0;
 @override
  Stream<CountState> mapEventToState(CountEvents event)async*{
if(event is Increment){
  yield IncrementState(counter: counter++);
}else if (event is Decrement){
  yield DecrementState(counter: counter--);
}
 }
}