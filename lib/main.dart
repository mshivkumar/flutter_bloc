import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/blocs/todo_search_bloc/todo_search_bloc.dart';
import 'package:testapp/screens/todo_home_page.dart';

import 'blocs/active_todo_count_bloc/active_todo_count_bloc.dart';
import 'blocs/filtered_todos_bloc/filtered_todos_bloc.dart';
import 'blocs/todo_filter_bloc/todo_filter_bloc.dart';
import 'blocs/todo_list_bloc/todo_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoSearchBloc()),
        BlocProvider(create: (context) => TodoFilterBloc()),
        BlocProvider(create: (context) => TodoListBloc()),
        BlocProvider(
            create: (context) => ActiveTodoCountBloc(
                initialActiveTodosCount:
                    context.read<TodoListBloc>().state.todos.length)),
        BlocProvider(
          create: (context) => FilteredTodosBloc(
            initialTodosList: context.read<TodoListBloc>().state.todos,
            todoFilterBloc: context.read<TodoFilterBloc>(),
            todoSearchBloc: context.read<TodoSearchBloc>(),
            todoListBloc: context.read<TodoListBloc>(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoHomePage(),
      ),
    );
  }
}
