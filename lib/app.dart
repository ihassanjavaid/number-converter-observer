import 'package:flutter/material.dart';
import 'package:number_converter_observer/observer/observer.dart';
import 'package:number_converter_observer/ui/main_screen.dart';
import 'package:provider/provider.dart';

class NumConv extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Observer(),
      child: MaterialApp(
        title: 'Number Converter',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
