import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bottom_navigator_cubit/state.dart';

class BCubit extends Cubit<BState>{
  BCubit():super(BState(currentIndex: 0, nextPage: false));
  static BCubit get(context)=>BlocProvider.of<BCubit>(context);
  onChangeValue(int index){
    emit(BState(currentIndex: index, nextPage: true));
  }
}