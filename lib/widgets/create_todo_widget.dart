import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/cubits.dart';

class CreateTodoWidget extends StatefulWidget {
  const CreateTodoWidget({Key? key}) : super(key: key);

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  TextEditingController addTodoEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: addTodoEditingController,
        decoration: const InputDecoration(labelText: 'What to do?'),
        onSubmitted: (String todoDesc) {
          if (todoDesc.trim().isNotEmpty) {
            context.read<TodoListCubit>().addTodo(desc: todoDesc);
            addTodoEditingController.clear();
          }
        });
  }

  @override
  void dispose() {
    addTodoEditingController.dispose();
    super.dispose();
  }
}
