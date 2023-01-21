

import 'package:bloc_sample_state/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sample_event.dart';
import 'bloc/sample_state.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends MaterialApp {
  /// {@macro ticker_app}
  MyApp({Key? key})
      : super(
    key: key,
    // home:MyHomePage(title: "Sample Bloc"),
    home: BlocProvider(
      create: (_) => SampleBloc(),
      child: const MyHomePage(),
    ),
  );
}


class MyHomePage extends StatelessWidget  {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: (){
                  context.read<SampleBloc>().add(const InitialEvent());
                },
                child: const Text("Initial State",)),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                context.read<SampleBloc>().add(const LoadingEvent());
              },
              child:  const Text("Loading State",)),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                context.read<SampleBloc>().add(const LoadedEvent());
              },
              child:  const Text("Loaded State",)),
            const SizedBox(height: 20,),
            InkWell(
                onTap: (){
                  context.read<SampleBloc>().add(const CompletedEvent());
                },
                child:  const Text("Completed State",)),
            const SizedBox(height: 40,),
            BlocBuilder<SampleBloc,SampleState>(builder: (context, state) {
             if(state is InitialState){
               return Text(state.value,style:const TextStyle(color: Colors.green),);
             }else if(state is LoadingState){
               return Text(state.value,style:const TextStyle(color: Colors.red),);
             }else if(state is LoadedState){
               return Text(state.value,style:const TextStyle(color: Colors.yellow),);
             }else if(state is CompletedState){
               return Text(state.value,style:const TextStyle(color: Colors.orange),);
             }
              return const Text("Default",style:TextStyle(color: Colors.red),);
            }),

          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            // onPressed: () => context.read<CounterCubit>().increment(),
            onPressed: () {
              // context.read<CounterCubit>().increment();
              // if (count == 33) {
              //   context.read<CounterCubit>().refresh();
              // }
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: (){}
                // context.read<CounterCubit>().decrement(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {}
                // context.read<CounterCubit>().refresh(),
          ),
        ],
      ),
    );
  }
}
