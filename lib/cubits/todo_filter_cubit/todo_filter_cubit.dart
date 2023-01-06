import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testapp/models/todo_model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());

  void changeFilter({required Filter newFilter}) {
    emit(state.copyWith(filter: newFilter));
  }
}
