
import 'package:bloc/bloc.dart';
import 'package:counter/modules/counter_screen/counter_screen.dart';
import 'package:counter/shared/bloc_observer.dart';
import 'package:flutter/material.dart';



void main(){
  BlocOverrides.runZoned(
        () {
      // Use cubits...
          runApp( const MyApp());
        },
    blocObserver: MyBlocObserver(),

  );


}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
