import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class NamedCounterCubit extends Cubit<NamedCounterState> {
  NamedCounterCubit() : super(NamedCounterState.initial());

  void incrementCounter() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
