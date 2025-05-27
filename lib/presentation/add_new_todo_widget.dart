import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/add_new_todo_bloc.dart';

class AddNewTodoWidget extends StatelessWidget {
  const AddNewTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return BlocConsumer<AddNewTodoBloc, AddNewTodoState>(
      builder: (BuildContext context, AddNewTodoState state) {
        switch (state) {
          case SavedTodo():
              return SizedBox.shrink();
          case CheckedTodo():
            return Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Title'),
                  controller: controller,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Description'),
                  controller: descriptionController,
                ),
                Checkbox(
                  value: state.isCompleted,
                  onChanged: (value) {
                    context.read<AddNewTodoBloc>().add(CheckTodoEvent(title: controller.text, description: descriptionController.text, isCompleted: value!));
                  },
                ),
                OutlinedButton(
                    onPressed: () {
                      context.read<AddNewTodoBloc>().add(SaveTodoEvent(title: controller.text, description: descriptionController.text, isCompleted: state.isCompleted));
                    },
                    child: Text("Add")
                ),
              ],
            );
        }
      },
      listener: (BuildContext context, AddNewTodoState state) {
        switch (state) {
          case SavedTodo():
            context.pop(true);
          case CheckedTodo():
        }
      },
    );
  }
}
