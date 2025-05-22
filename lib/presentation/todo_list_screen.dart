import 'package:bloc_update/presentation/todo_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/todo_list_bloc.dart';
import '../routes/Routes.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoListBloc(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Todo List"),
          ),
          body: const TodoListWidget(),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await context.push(Routes.addNewTodo);
              if (result == true) {
                print("Back add");
                context.read<TodoListBloc>().add(LoadTodos());
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
