import 'package:bloc_sample_state/bloc/sample_event.dart';
import 'package:bloc_sample_state/bloc/sample_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBloc extends Bloc<SampleEvent,SampleState>{
  SampleBloc() : super(const InitialState()){
    on<InitialEvent>((event,emit) {
      emit(const InitialState());
    });
    on<LoadingEvent>((event,emit) {
      emit(const LoadingState());
       });
    on<LoadedEvent>((event,emit){
      emit(const LoadedState());
    });
    on<CompletedEvent>((event,emit) {
      emit(const CompletedState());
    });
  }
}