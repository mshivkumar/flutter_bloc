import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/widgets/todo_item_widget.dart';

import '../blocs/filtered_todos_bloc/filtered_todos_bloc.dart';
import '../blocs/todo_list_bloc/todo_list_bloc.dart';
import '../models/todo_model.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Todo> filteredTodos =
        context.watch<FilteredTodosBloc>().state.todos;

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: filteredTodos.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.grey,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: showBackground(direction: 0),
          secondaryBackground: showBackground(direction: 1),
          key: ValueKey(filteredTodos[index].id),
          child: TodoItemWidget(todo: filteredTodos[index]),
          confirmDismiss: (_) {
            return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do you really want to delete?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('NO'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('YES'),
                    ),
                  ],
                );
              },
            );
          },
          onDismissed: (_) {
            context
                .read<TodoListBloc>()
                .add(DeleteTodoEvent(id: filteredTodos[index].id));
          },
        );
      },
    );
  }

  Widget showBackground({required int direction}) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment:
          (direction == 0) ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
