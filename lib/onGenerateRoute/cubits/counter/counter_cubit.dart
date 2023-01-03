import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class onGenerateCounterCubit extends Cubit<onGenerateCounterState> {
  onGenerateCounterCubit() : super(onGenerateCounterState.initial());

  void incrementCounter() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
