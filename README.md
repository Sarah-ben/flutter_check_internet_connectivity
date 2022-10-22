
### how to check internet using both cubit &amp; bloc### Screenshot
***

## Technologies
***
A list of technologies used within the project:
* Bloc
* Equatable

## general info
- Bloc(cubit) is a state (data) management

Bloc extends cubit , then where is the difference between them?
cubit is a apart of bloc, this means it uses the same functionalities as bloc, _**this is exremenly wrong!!!!**_, cubit is just the minimal version of Bloc, this means u can use cubit for small apps or functionalities simply because it sends _**functions**_ to get states but not _**streams**_ as bloc does.

what is Equatable, why do we use it with bloc?
it's a package that used to compare objects in DART, this means : if two  objects are the same instance it returns true , for that if we wanna compare variables we need to put theme inside **List<Object> get props => [variable];**, in this case only variables would be compared, if u did not put them inside it it will compare only objects. check out this code
  
***
```
import 'package:equatable/equatable.dart';


class TestEquatable extends Equatable{
  final String name;
  const TestEquatable(this.name);
  @override
  List<Object?> get props =>[];
}
void main(){
  print(TestEquatable('sara')==TestEquatable('bensalem'));
}
  
```
the result here will be : true 
  why? simply because u did not add 'name' to be compared, u just compared instances  .
  
u have to add 'name' inside to be compared
  ```
  @override
  List<Object?> get props =>[name]; 
```
