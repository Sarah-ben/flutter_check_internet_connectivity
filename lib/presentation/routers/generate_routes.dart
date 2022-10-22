import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/business_logic/cubit/counter_cubit.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/presentation/screens/second_page.dart';

import '../main_layout/main_layout.dart';
import '../screens/third_page.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>  MainLayout(),
                );
      case '/first':
        return MaterialPageRoute(
          builder: (_) =>  FirstPage(),
        );
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondPage(),
                );
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdPage(),
                );
      default:
        return null;
    }
  }


}
