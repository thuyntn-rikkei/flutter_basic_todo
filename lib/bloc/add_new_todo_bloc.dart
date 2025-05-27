import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/todo.dart';
import '../data/todo_share_preferences.dart';

part 'add_new_todo_event.dart';

part 'add_new_todo_state.dart';

class AddNewTodoBloc extends Bloc<AddNewTodoEvent, AddNewTodoState> {
  final TodoSharePreferences _todoSharePreferences = TodoSharePreferences();

  AddNewTodoBloc() : super(CheckedTodo(isCompleted: false)) {
    on<AddNewTodoEvent>((event, emit) async {
      switch (event) {
        case SaveTodoEvent():
          String id = DateTime.timestamp().toString();
          _todoSharePreferences.saveTodo(
            id,
            Todo(id: id, title: event.title, description: event.description, isCompleted: event.isCompleted)
          );
          emit(SavedTodo() as AddNewTodoState);
        case CheckTodoEvent():
          emit(CheckedTodo(isCompleted: event.isCompleted) as AddNewTodoState);
      }
    });
  }
}
