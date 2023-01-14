import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../todo_list_cubit/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  int initialActiveTodoCount;
  final TodoListCubit todoListCubit;
  late final StreamSubscription todoListSubscription;

  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('TodoListState: $todoListState');

      int currentActiveTodosCount = todoListState.todos
          .where((todo) => !todo.isCompleted)
          .toList()
          .length;
      emit(state.copyWith(activeTodoCount: currentActiveTodosCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
