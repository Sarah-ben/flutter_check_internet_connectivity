import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_state.dart';

class NavCubit extends Cubit<NavState>{
  NavCubit():super(NavState(currentIndex: 0));
  void changePage(int index)=>emit(NavState(currentIndex: index));

}