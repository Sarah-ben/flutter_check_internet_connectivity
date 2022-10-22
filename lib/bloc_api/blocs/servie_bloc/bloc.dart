import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc_api/blocs/servie_bloc/events.dart';
import 'package:untitled1/bloc_api/blocs/servie_bloc/states.dart';

import '../../data/repository.dart';

class ServiceBloc extends Bloc<ServiceEvent,ServiceState>{
  final ServiceRepo repo;
  ServiceBloc(this.repo):super(ServiceLoadingState()){
    on<LoadServiceEvent>((event, emit)async {
     emit(ServiceLoadingState());
     try{
       final services=await repo.getServices();
       emit(ServiceLoadedState(services: services));
     }catch(e){
       emit(ServiceErrorState(msg: e.toString()));
     }
    });
  }



}