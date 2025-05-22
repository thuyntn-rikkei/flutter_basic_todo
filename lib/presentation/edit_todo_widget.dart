
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/edit_todo_bloc.dart';

class EditTodoWidget extends StatelessWidget {
  const EditTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return BlocConsumer<EditTodoBloc, EditTodoState>(
      builder: (BuildContext context, EditTodoState state) {
        switch (state) {
          case EditTodoInitial():
            return SizedBox.shrink();
          case UpdatedTodo():
            return SizedBox.shrink();
          case LoadedTodo():
            controller.text = state.title;
            return Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Title'),
                  controller: controller,
                ),
                OutlinedButton(
                    onPressed: () {
                      context.read<EditTodoBloc>().add(UpdateTodoEvent(title: controller.text));
                    },
                    child: Text("Update")
                ),
              ],
            );
        }
      },
      listener: (BuildContext context, EditTodoState state) {
        switch (state) {

          case EditTodoInitial():

          case UpdatedTodo():
            context.pop(true);
          case LoadedTodo():

        }
      },
    );
  }
}
