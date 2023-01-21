import 'package:equatable/equatable.dart';

abstract class SampleState extends Equatable{
  const SampleState();
  @override
  List<Object> get props=>[];
}

class InitialState extends SampleState{
    const InitialState();
    final String value="Initial State Processed";
    @override
  List<Object> get props=>[value];
}

class LoadingState extends SampleState{
  const LoadingState();
  final String value="Loading State Processed";
  @override
  List<Object> get props=>[value];
}

class LoadedState extends SampleState{
  const LoadedState();
  final String value="Loaded State Processed";
  @override
  List<Object> get props=>[value];
}

class CompletedState extends SampleState{
  const CompletedState();
  final String value="Completed State Processed";
  @override
  List<Object> get props=>[value];
}