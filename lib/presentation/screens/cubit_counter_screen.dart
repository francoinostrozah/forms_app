import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    final increaseBy = context.read<CounterCubit>().increaseBy;
    final reset = context.read<CounterCubit>().reset;

    return Scaffold(
      appBar: AppBar(
        // title: context.select((CounterCubit value) {
        //   return Text('Cubit Counter ${value.state.transactionCount}');
        // }),
        actions: [
          IconButton(
              onPressed: () => reset(), icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            print('El estado cambió');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: () => increaseBy(3),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () => increaseBy(2),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: () => increaseBy(1),
          )
        ],
      ),
    );
  }
}
