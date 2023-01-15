import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../todo_list_cubit/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  TodoListCubit todoListCubit = TodoListCubit();
  late StreamSubscription todoListCubitStreamSubscription;

  ActiveTodoCountCubit({required this.todoListCubit})
      : super(ActiveTodoCountState.initial()) {
    todoListCubitStreamSubscription =
        todoListCubit.stream.listen((todoListState) {
      int activeTodoCount = todoListState.todos
          .where((todo) => !todo.isCompleted)
          .toList()
          .length;
      emit(state.copyWith(activeTodoCount: activeTodoCount));
    });
  }

  @override
  Future<void> close() async {
    todoListCubitStreamSubscription.cancel();
    super.close();
  }
}
