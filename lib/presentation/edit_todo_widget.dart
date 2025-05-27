
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/edit_todo_bloc.dart';

class EditTodoWidget extends StatelessWidget {
  EditTodoWidget({super.key});
  final TextEditingController controller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditTodoBloc, EditTodoState>(
      builder: (BuildContext context, EditTodoState state) {
        switch (state) {
          case EditTodoInitial():
            return SizedBox.shrink();
          case UpdatedTodo():
            return SizedBox.shrink();
          case LoadedTodo():
            controller.text = state.title;
            descriptionController.text = state.description;
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
                    context.read<EditTodoBloc>().add(CheckedTodoEvent(title: controller.text, description: descriptionController.text, isCompleted: value!));
                  },
                ),
                OutlinedButton(
                    onPressed: () {
                      context.read<EditTodoBloc>().add(UpdateTodoEvent(title: controller.text, description: descriptionController.text, isCompleted: state.isCompleted));
                    },
                    child: Text("Update")
                ),
              ],
            );
          case ErrorTodo():
            return Center(
              child: Text("Error"),
            );
        }
      },
      listener: (BuildContext context, EditTodoState state) {
        if(state is UpdatedTodo){
          context.pop(true);
        }
      },
    );
  }
}
