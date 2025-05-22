import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/todo_share_preferences.dart';

part 'add_new_todo_event.dart';

part 'add_new_todo_state.dart';

class AddNewTodoBloc extends Bloc<AddNewTodoEvent, AddNewTodoState> {
  final TodoSharePreferences _todoSharePreferences = TodoSharePreferences();

  AddNewTodoBloc() : super(AddNewTodoInitial()) {
    on<AddNewTodoEvent>((event, emit) async {
      switch (event) {
        case SaveTodoEvent():
          _todoSharePreferences.saveTodo(
            DateTime.timestamp().toString(),
            event.title,
          );
          emit(SavedTodo() as AddNewTodoState);
      }
    });
  }
}
