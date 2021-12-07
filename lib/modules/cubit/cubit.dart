import 'package:bloc/bloc.dart';
import 'package:counter/modules/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitState());

  static CounterCubit get(context)=> BlocProvider.of(context);

  int counter =0;
  void minus(){
    counter>0?counter--:null;
    emit(CounterMinusState());
  }
  void plus(){
    counter++;
    emit(CounterPlusState());
  }
  void reset(){
    counter=0;
    emit(CounterResetState());
  }
}

