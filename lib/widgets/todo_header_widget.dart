import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/cubits.dart';

import '../cubits/active_todo_count_cubit/active_todo_count_cubit.dart';

class TodoHeaderWidget extends StatelessWidget {
  const TodoHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 52.0),
        ),
        BlocListener<TodoListCubit, TodoListState>(
          listener: (BuildContext context, TodoListState todoListState) {
            int currentActiveTodosCount = todoListState.todos
                .where((todo) => !todo.isCompleted)
                .toList()
                .length;

            context.read<ActiveTodoCountCubit>().calculateActiveTodoCount(
                activeTodoCount: currentActiveTodosCount);
          },
          child: Text(
              '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.redAccent,
              )),
        )
      ],
    );
  }
}
