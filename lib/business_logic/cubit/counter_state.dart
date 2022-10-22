part of 'counter_cubit.dart';

 class CounterState extends Equatable {

     int counterValue;
     bool isIncremented;
     CounterState({
required this.counterValue,
       required this.isIncremented
     });

     Map<String,dynamic>toMap(){
       return{
         'counterValue':counterValue,
         'isIncremented':isIncremented
       };
     }


    factory CounterState.fromMap(Map<String,dynamic>map){
       return CounterState(
           counterValue: map['counterValue'],
           isIncremented: map['isIncremented']);
     }
String toJson()=>json.encode(toMap());
     factory CounterState.fromJson(String source)=>CounterState.fromMap(json.decode(source));
  @override
  List<Object?> get props => [
    counterValue,
    isIncremented
  ];
 }



