
import 'package:bloc_update/bloc/add_new_todo_bloc.dart';
import 'package:bloc_update/presentation/add_new_todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewTodoScreen extends StatelessWidget {
  const AddNewTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewTodoBloc(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Add New Todo"),
          ),
          body: AddNewTodoWidget(),
      ),
    );
  }
}
