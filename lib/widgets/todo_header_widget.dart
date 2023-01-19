import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/blocs/active_todo_count_bloc/active_todo_count_bloc.dart';
import 'package:testapp/blocs/todo_list_bloc/todo_list_bloc.dart';

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
        BlocListener<TodoListBloc, TodoListState>(
          listener: (BuildContext context, TodoListState todoListState) {
            int activeTodosCount = todoListState.todos
                .where((todo) => !todo.isCompleted)
                .toList()
                .length;

            context
                .read<ActiveTodoCountBloc>()
                .add(TodoActiveCountEvent(activeTodosCount: activeTodosCount));
          },
          child: Text(
              '${context.watch<ActiveTodoCountBloc>().state.activeTodoCount} items left',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.redAccent,
              )),
        )
      ],
    );
  }
}
