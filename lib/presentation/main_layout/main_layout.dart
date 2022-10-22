import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/business_logic/nav_cubit/nav_cubit.dart';
import 'package:untitled1/business_logic/nav_cubit/nav_state.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/presentation/screens/second_page.dart';

class MainLayout extends StatelessWidget {
   MainLayout({Key? key}) : super(key: key);
 int currentIndex=0;
 List pages=[
   FirstPage(),
   SecondPage()
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<NavCubit,NavState>(
        builder: (context,state){
          return pages[state.currentIndex];
        },
      ),

      bottomNavigationBar:BlocBuilder<NavCubit,NavState>(
        builder: (context,state){
         return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.verified_user),label: 'home'),
            ],
            currentIndex: state.currentIndex,
            onTap: (int index){
             BlocProvider.of<NavCubit>(context).changePage(index);
            },
          );
        },
      )
    );
  }
}
