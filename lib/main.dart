import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled1/bloc_api/blocs/internet_bloc/internet_bloc.dart';
import 'package:untitled1/bloc_api/blocs/servie_bloc/bloc.dart';
import 'package:untitled1/bloc_api/blocs/servie_bloc/events.dart';
import 'package:untitled1/bloc_api/data/repository.dart';
import 'package:untitled1/bloc_api/views/service_ui.dart';
import 'package:untitled1/bottom_navigator_cubit/cubit.dart';
import 'package:untitled1/bottom_navigator_cubit/state.dart';
import 'package:untitled1/business_logic/internet_cubit/internet_cubit.dart';
import 'package:untitled1/business_logic/internet_cubit/internet_state.dart';
import 'package:untitled1/business_logic/nav_cubit/nav_cubit.dart';
import 'package:untitled1/components/constants/enum.dart';
import 'package:untitled1/presentation/main_layout/main_layout.dart';
import 'package:untitled1/presentation/routers/generate_routes.dart';
import 'package:untitled1/presentation/screens/first_page.dart';
import 'package:untitled1/presentation/screens/second_page.dart';
import 'package:untitled1/presentation/screens/third_page.dart';

import 'business_logic/blocs/bloc.dart';
import 'business_logic/blocs/events.dart';
import 'business_logic/blocs/states.dart';
import 'business_logic/cubit/counter_cubit.dart';
import 'business_logic/utility/app_bloc_observer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // final storage = await HydratedStorage.build(storageDirectory:await getApplicationDocumentsDirectory() );
  final CounterState s1=CounterState(counterValue: 0, isIncremented: false);
  final CounterState s2=CounterState(counterValue: 0, isIncremented: false);
   print(s1==s2);
  Bloc.observer=AppBlocObserver();

  runApp( MyApp(

    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp(
      {required this.appRouter,
      required this.connectivity}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //CounterCubit _cubit=CounterCubit();
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubitCubit>(create: (context)=>InternetCubitCubit(connectivity: connectivity),),
        BlocProvider<CounterCubit>(create: (context)=>CounterCubit(//internetCubitCubit: BlocProvider.of<InternetCubitCubit>(context)
        ),),
        BlocProvider<NavCubit>(create: (context)=>NavCubit(),),
        BlocProvider<CounterBloc>(create: (context)=>CounterBloc(InitialState(init: 0)))
      ],
      child: MaterialApp(
        /* routes: {
         '/':(context)=>BlocProvider(
             create: (context)=>NavCubit(),child:
         MainLayout()),
         '/first':(context)=>BlocProvider.value(
             value: _cubit,child:
        const FirstPage()),
           '/second':(context)=>BlocProvider.value(
             value: BlocProvider.of<CounterCubit>(context),child:
        const SecondPage()),
         '/third':(context)=>BlocProvider.value(
             value: _cubit,child:
        const ThirdPage()),
      },
*/
        //onGenerateRoute:appRouter.onGenerateRoute ,
        title: 'Flutter Demo',
         home: RepositoryProvider<ServiceRepo>(
           create: (context)=>ServiceRepo(),
           child: MultiBlocProvider(providers: [
             BlocProvider<ServiceBloc>(
               create: (context)=>ServiceBloc(context.read<ServiceRepo>())..add(LoadServiceEvent()) ,

             ),
             BlocProvider<InternetBloc>(
               create: (context)=>InternetBloc()) ,

           ], child: const ServiceApp(),

           )
         ),
      ) ,);
  }

}


class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
late CounterBloc bloc;

@override
  void initState() {
   bloc=context.read<CounterBloc>();
    super.initState();
  }
@override
  void dispose() {
   bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubitCubit,InternetCubitState>(listener: (context,state){
      if( state is InternetConnected && state.connectionType==ConnectionType.wifi){
        BlocProvider.of<CounterCubit>(context).increment();
      }else  if( state is InternetConnected && state.connectionType==ConnectionType.mobile){
        BlocProvider.of<CounterCubit>(context).decrement();
      }
    },child:  Scaffold(
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
             /* BlocBuilder<InternetCubitCubit,InternetCubitState>(builder: (context,state){
                if( state is InternetConnected && state.connectionType==ConnectionType.wifi){
                  return const Text('wifi');
                }else  if( state is InternetConnected && state.connectionType==ConnectionType.mobile){
                  return const Text('mobile');
                }else  if( state is InternetDisconnected){
                  return const Text('disconnected');
                }
                return const CircularProgressIndicator();
              }),
              const Text(
                'You have pushed the button this many times:',
              ),
             Builder(builder: (context) {
               final counterValue=context.select((CounterCubit cubit) => cubit.state.counterValue);
                return  Text(
                  counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
                Builder(builder: (context){
                  final counterState=context.watch<CounterCubit>().state;
                  final internetState=context.watch<InternetCubitCubit>().state;
                  if(internetState is InternetConnected && internetState.connectionType==ConnectionType.mobile){
                    return Text('${counterState.counterValue} ${internetState.connectionType}');
                  }else if(internetState is InternetConnected && internetState.connectionType==ConnectionType.wifi){
                    return Text('${counterState.counterValue} ${internetState.connectionType}');
                  }else{
                    return Text('Disconnected');
                  }
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
                       // BlocProvider.of<CounterCubit>(context).decrement();
                        context.read<CounterCubit>().decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.minimize),
                    ),
                    const SizedBox(width: 20,),
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: (){
                       // BlocProvider.of<CounterCubit>(context).increment();
                        context.read<CounterCubit>().increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),


              MaterialButton(onPressed: (){
                /* Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider.value(
                    value: BlocProvider.of<CounterCubit>(context),
                    child: SecondPage(),
                  )));*/
               Navigator.of(context).pushNamed('/second');
              },child: Text('next screen'),)
           */
              Builder(builder: (context){
                final state=context.watch<CounterBloc>().state;
                if (state is IncrementState  ) {
                  return Text(state.counter.toString());
                }else if (state is DecrementState  ) {
                  return Text(state.counter.toString());
                }else{
                  return Text("0");
                }
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
                      // BlocProvider.of<CounterCubit>(context).decrement();
                      //context.read<CounterBloc>().;
                      bloc.add(Increment());
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.minimize),
                  ),
                  const SizedBox(width: 20,),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: (){
                      // BlocProvider.of<CounterCubit>(context).increment();
                     // context.read<CounterCubit>().increment();
                      bloc.add(Decrement());

                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              MaterialButton(onPressed: (){
                Stream<int>stream= testStream(10);
                sumstream(stream);
              },
              child: Text('test steam',style: TextStyle(color: Colors.black),),)
            ],
          ),
        ),),
    ),);

  }

  Stream<int>testStream(int number)async* {
  for (int i=0;i<=number;i++){
    yield i;
  }
  }

  Future sumstream(Stream<int>stream)async{
  int s=0;
   await for (int i in stream){
s=s+i;
log("$i");
  }
  }
}
