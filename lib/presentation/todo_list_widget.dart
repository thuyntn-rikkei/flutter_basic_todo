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
                  id: state.todos[index].id,
                  title: state.todos[index].title,
                  description: state.todos[index].description,
                  isCompleted: state.todos[index].isCompleted,
                );
              },
            );
        }
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  const TodoItem({super.key, required this.title, required this.description, required this.isCompleted, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(description),
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                context.read<TodoListBloc>().add(CheckedTodo(id: id, title: title, description: description, isCompleted: value!));
              },
            ),
            IconButton(
              onPressed: () {
                context.read<TodoListBloc>().add(DeleteTodo(id: id));
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      onTap: () async {
        final result = await context.push('${Routes.editTodo}/$id');
        if (result == true) {
          print("Back edit");
          context.read<TodoListBloc>().add(LoadTodos());
        }
      },
    );
  }
}
