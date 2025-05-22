import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/todo_list_bloc.dart';
import '../data/todo.dart';
import '../routes/Routes.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListBloc, TodoListState>(
      builder: (BuildContext context, TodoListState state) {
        switch (state) {
          case TodoListInitial():
            context.read<TodoListBloc>().add(LoadTodos());
            return const SizedBox.shrink();
          case TodoListLoading():
            return const Center(child: CircularProgressIndicator());
          case TodoListLoaded():
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoItem(
                  first: state.todos.entries.elementAt(index).key,
                  second: state.todos.entries.elementAt(index).value,
                );
              },
            );
        }
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.first, required this.second});

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(second),
            Text(first),
            IconButton(
              onPressed: () {
                context.read<TodoListBloc>().add(DeleteTodo(id: first));
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      onTap: () async {
        final result = await context.push('${Routes.editTodo}/$first');
        if (result == true) {
          print("Back edit");
          context.read<TodoListBloc>().add(LoadTodos());
        }
      },
    );
  }
}
