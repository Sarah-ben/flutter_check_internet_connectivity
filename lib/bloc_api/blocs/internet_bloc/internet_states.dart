class InternetState{}
class InitState  extends InternetState{}
class ConnectedState  extends InternetState{
  String msg;
  ConnectedState(this.msg);
}
class DisconnectedState  extends InternetState{
  String msg;
  DisconnectedState(this.msg);
}
