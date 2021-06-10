import 'package:coffe_app/layout/bloc/coffe_bloc.dart';
import 'package:coffe_app/layout/coffee_concept_home.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/modules/CoffeeConceptList.dart';

class MainCoffeeConceptApp extends StatefulWidget {
  @override
  _MainCoffeeConceptAppState createState() => _MainCoffeeConceptAppState();
}

class _MainCoffeeConceptAppState extends State<MainCoffeeConceptApp> {
  final bloc = CoffeeBloc();
  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: CoffeeProvider(
          bloc: bloc,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
              home: CofeeConceptList()),
          ),
    );
  }
}
