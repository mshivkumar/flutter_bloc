import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/todo_list_cubit/todo_list_cubit.dart';
import '../models/todo_model.dart';

class TodoItemWidget extends StatefulWidget {
  final Todo todo;

  const TodoItemWidget({required this.todo, Key? key}) : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late final TextEditingController _todoDescController;

  @override
  void initState() {
    _todoDescController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _todoDescController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              bool error = false;
              _todoDescController.text = widget.todo.desc;

              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: const Text('Edit Todo'),
                  content: TextField(
                    controller: _todoDescController,
                    autofocus: true,
                    decoration: InputDecoration(
                        errorText: error ? 'Value cannot be empty' : ''),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            error =
                                _todoDescController.text.isEmpty ? true : false;
                            if (!error) {
                              context.read<TodoListCubit>().editTodo(
                                  id: widget.todo.id,
                                  newDesc: _todoDescController.text);
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                      child: const Text('SAVE'),
                    ),
                  ],
                );
              });
            });
      },
      leading: Checkbox(
        value: widget.todo.isCompleted,
        onChanged: (bool? value) {
          context
              .read<TodoListCubit>()
              .toggleStatus(id: widget.todo.id, isCompleted: value!);
        },
      ),
      title: Text(
        widget.todo.desc,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}
