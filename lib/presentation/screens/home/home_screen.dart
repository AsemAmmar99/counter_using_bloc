import 'package:counter/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/counter/counter_cubit.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late CounterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        backgroundColor: orange,
        appBar: AppBar(
          backgroundColor: black,
          title: const Center(
            child: Text(
                'My Counter',
              style: TextStyle(
                color: orange,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            cubit = CounterCubit.get(context);
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: black,
                    onPressed: () => cubit.decrementCounter(),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: BlocBuilder<CounterCubit, CounterStates>(
                      builder: (context, state) {
                        return Text(
                          '${cubit.counter}',
                          style: Theme.of(context).textTheme.headline4?.copyWith(color: white),
                        );
                      },
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: black,
                    onPressed: () => cubit.incrementCounter(),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}