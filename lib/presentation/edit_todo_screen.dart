import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/edit_todo_bloc.dart';
import 'edit_todo_widget.dart';

class EditTodoScreen extends StatelessWidget {
  const EditTodoScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTodoBloc(id)..add(LoadTodoEvent(id: id)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Edit Todo"),
        ),
        body: EditTodoWidget(),
      ),
    );
  }
}
