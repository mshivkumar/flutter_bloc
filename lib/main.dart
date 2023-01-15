import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/active_todo_count_cubit/active_todo_count_cubit.dart';
import 'package:testapp/cubits/filtered_todos_cubit/filtered_todos_cubit.dart';
import 'package:testapp/cubits/todo_filter_cubit/todo_filter_cubit.dart';
import 'package:testapp/cubits/todo_list_cubit/todo_list_cubit.dart';
import 'package:testapp/cubits/todo_search_cubit/todo_search_cubit.dart';
import 'package:testapp/screens/todo_home_page.dart';

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
        BlocProvider(create: (context) => TodoSearchCubit()),
        BlocProvider(create: (context) => TodoFilterCubit()),
        BlocProvider(create: (context) => TodoListCubit()),
        BlocProvider(
            create: (context) => ActiveTodoCountCubit(
              initialActiveTodosCount: context.read<TodoListCubit>().state.todos.length,
                todoListCubit: context.read<TodoListCubit>())),
        BlocProvider(
          create: (context) => FilteredTodosCubit(
            initialTodosList: context.read<TodoListCubit>().state.todos,
            todoFilterCubit: context.read<TodoFilterCubit>(),
            todoSearchCubit: context.read<TodoSearchCubit>(),
            todoListCubit: context.read<TodoListCubit>(),
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
