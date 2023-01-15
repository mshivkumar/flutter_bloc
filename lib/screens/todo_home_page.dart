import 'package:flutter/material.dart';

import '../widgets/create_todo_widget.dart';
import '../widgets/search_and_filter_widget.dart';
import '../widgets/show_todos.dart';
import '../widgets/todo_header_widget.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                TodoHeaderWidget(),
                CreateTodoWidget(),
                SizedBox(
                  height: 20.0,
                ),
                SearchAndFilterWidget(),
                ShowTodos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
