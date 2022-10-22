import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc_api/blocs/internet_bloc/internet_bloc.dart';
import 'package:untitled1/bloc_api/blocs/internet_bloc/internet_states.dart';
import 'package:untitled1/bloc_api/blocs/servie_bloc/bloc.dart';
import 'package:untitled1/bloc_api/blocs/servie_bloc/states.dart';

class ServiceApp extends StatelessWidget {
  const ServiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: BlocListener<InternetBloc,InternetState>(

          listener: (BuildContext context, state) {
            if(state is ConnectedState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.msg))
              );
            }else if (state is DisconnectedState){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.msg))
              );
            }
          },
          child: Center(
            child: BlocBuilder<ServiceBloc,ServiceState>(
              builder: (context,state){
                if(state is ServiceLoadingState){
                  return CircularProgressIndicator();
                }else if(state is ServiceLoadedState){
                  return ListView.builder(
                    itemCount: state.services.length,
                  itemBuilder: (context,index){
                      return ListTile(
                        title: Text("${state.services[index].name}"),
                        subtitle: Text("${state.services[index].info}"),
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage("${state.services[index].image}"),
                        ),
                      );
                  },
                  );
                }else if (state is ServiceErrorState){
                  return Text(state.msg);
                }else
                {
                  return SizedBox();
                }
              },
            ),
          ),
        ),
      )
    );
  }
}
