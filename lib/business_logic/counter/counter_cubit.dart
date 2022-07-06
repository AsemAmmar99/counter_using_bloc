import 'package:counter/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitial());

  static CounterCubit get(context) => BlocProvider.of<CounterCubit>(context);

  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    emit(CounterIncrementState());
  }

  void decrementCounter() {
    if(_counter>0) {
      _counter--;
      emit(CounterDecrementState());
    }else{
      Fluttertoast.showToast(
          msg: "Number can't be minus",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: black,
          textColor: white,
          fontSize: 16.0
      );
    }}
}