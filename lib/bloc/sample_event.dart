import 'package:equatable/equatable.dart';

abstract class SampleEvent extends Equatable{
  const SampleEvent();

  @override
  List<Object> get props=>[];
}

class InitialEvent extends SampleEvent{
  const InitialEvent();
}

class LoadingEvent extends SampleEvent{
  const LoadingEvent();
}

class LoadedEvent extends SampleEvent{
  const LoadedEvent();
}

class CompletedEvent extends SampleEvent{
  const CompletedEvent();
}