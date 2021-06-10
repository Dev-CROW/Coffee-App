import 'package:coffe_app/layout/cubit.dart';
import 'package:coffe_app/layout/states.dart';
import 'package:coffe_app/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constant.dart';
import 'modules/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> ShopCubit()..getUserData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context , state) {},
        builder: (context , state) {
          return MaterialApp(
            title: 'Coffee',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: SplashScreen(),
          );
        },

      ),
    );
  }
}