import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementCounterSize = 1;

  CounterCubit() : super(CounterState.initial());

  void changeCounter({required int incrementSize}) {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }
}
