import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/cubits.dart';
import 'package:testapp/screens/todo_home_page.dart';
import 'cubits/todo_list_cubit/todo_list_cubit.dart';

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
        BlocProvider(create: (context) => TodoFilterCubit()),
        BlocProvider(create: (context) => TodoSearchCubit()),
        BlocProvider(create: (context) => TodoListCubit()),
        BlocProvider(
          create: (context) => ActiveTodoCountCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todos.length,
          ),
        ),
        BlocProvider(
            create: (context) => FilteredTodosCubit(
                  initialTodos: context.read<TodoListCubit>().state.todos,
                )),
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
