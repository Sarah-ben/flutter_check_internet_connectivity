

import '../../components/constants/enum.dart';

class InternetCubitState {}

class InternetLoading extends InternetCubitState {}
class InternetConnected extends InternetCubitState {
  final  connectionType;
  InternetConnected({required this.connectionType});
}
class InternetDisconnected extends InternetCubitState {}
