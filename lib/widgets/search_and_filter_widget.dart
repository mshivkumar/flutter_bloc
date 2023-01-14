import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/cubits.dart';
import 'package:testapp/utils/debounce.dart';

import '../models/todo_model.dart';

class SearchAndFilterWidget extends StatelessWidget {
  SearchAndFilterWidget({Key? key}) : super(key: key);
  final debounce = Debounce(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search Todos',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              // Future.delayed(const Duration(milliseconds: 500), () {
              //   context
              //       .read<TodoSearchCubit>()
              //       .setSearchTerm(newSearchTerm: newSearchTerm);
              // });

              debounce.run(() {
                context
                    .read<TodoSearchCubit>()
                    .setSearchTerm(newSearchTerm: newSearchTerm);
              });
            }
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _filterTodoButton(context: context, filter: Filter.all),
            _filterTodoButton(context: context, filter: Filter.active),
            _filterTodoButton(context: context, filter: Filter.completed),
          ],
        ),
      ],
    );
  }

  TextButton _filterTodoButton(
      {required BuildContext context, required Filter filter}) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(newFilter: filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
            fontSize: 18.0,
            color: _textColor(context: context, filter: filter)),
      ),
    );
  }

  Color _textColor({required BuildContext context, required Filter filter}) {
    final todoFilterState = context.watch<TodoFilterCubit>().state.filter;
    return (filter == todoFilterState) ? Colors.blue : Colors.grey;
  }
}