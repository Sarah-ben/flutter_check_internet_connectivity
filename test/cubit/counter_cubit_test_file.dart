import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/business_logic/cubit/counter_cubit.dart';

void main(){
  group('CounterCubit', () {
    CounterCubit counterCubit=CounterCubit();
    setUp(() {
     counterCubit=CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });
    test('the initial state for the counterCubit is counterState(initialValue:0)', () {
      expect(counterCubit.state, CounterState(counterValue: 0, isIncremented: false));
    });

    blocTest('the cubit should emit a counter state (counterValue:1,isIncremented:true) when cubit.increment is called',
        build: () =>counterCubit,
      act: (cubit)=>cubit.increment(),
      expect: ()=>[ CounterState(counterValue: 1, isIncremented: true)]
    );

    blocTest('the cubit emit a counter state (counterValue:-1,isIncremented:false)when cubit.decrement is called',
        build: ()=>counterCubit,
         act: (cubit)=>cubit.decrement(),
        expect: ()=>[CounterState(counterValue: -1, isIncremented: false)]
    );
  });



}