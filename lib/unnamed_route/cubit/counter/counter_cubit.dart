import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class UnnamedCounterCubit extends Cubit<UnnamedCounterState> {
  UnnamedCounterCubit() : super(UnnamedCounterState.initial());

  void incrementCounter() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
