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
    return BlocConsumer<AddNewTodoBloc, AddNewTodoState>(
      builder: (BuildContext context, AddNewTodoState state) {
        switch (state) {
          case AddNewTodoInitial():
            return Column(
              children: [
                TextField(
                    decoration: InputDecoration(hintText: 'Title'),
                    controller: controller,
                ),
                OutlinedButton(
                    onPressed: () {
                      context.read<AddNewTodoBloc>().add(SaveTodoEvent(title: controller.text));
                    }, 
                    child: Text("Add")
                ),
              ],
            );
          case SavedTodo():
              return SizedBox.shrink();
        }
      },
      listener: (BuildContext context, AddNewTodoState state) {
        switch (state) {

          case AddNewTodoInitial():

          case SavedTodo():
            context.pop(true);
        }
      },
    );
  }
}
