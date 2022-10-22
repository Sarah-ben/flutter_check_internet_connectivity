import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/presentation/screens/second_page.dart';

import '../../business_logic/cubit/counter_cubit.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body:  BlocListener<CounterCubit,CounterState>(listener: (BuildContext context, state) {
        if(state.isIncremented){
          print('incremented');
        }else{
          print('decremented');
        }
      },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
                return  Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              }, listener: (context, state) {
                if(state.isIncremented){
                }else{
                  log('decremented');
                }
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.minimize),
                  ),
                  const SizedBox(width: 20,),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: (){
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              MaterialButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider.value(
                  value: BlocProvider.of<CounterCubit>(context),
                  child: SecondPage(),
                )));
              },child: Text('next screen'),)
            ],
          ),
        ),),
    );
  }
}
