part of 'counter_cubit.dart';

@immutable
abstract class CounterStates {}

class CounterInitial extends CounterStates {}

class CounterDecrementState extends CounterStates {}

class CounterIncrementState extends CounterStates {}