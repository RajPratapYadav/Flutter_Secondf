import 'package:flutter/material.dart';
import 'package:untitled1/Uitils/Constants.dart';
import 'MainScreen.dart';

void main() async{
  runApp(State1());
}
class State1 extends StatefulWidget{
  @override
  MyApp createState() => MyApp();

}
class MyApp extends State<State1> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOOD HUB',
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
          home: MainScreen(),
    );
  }
}
