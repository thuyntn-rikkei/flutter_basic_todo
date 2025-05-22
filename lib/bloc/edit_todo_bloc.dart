import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/todo_share_preferences.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  final TodoSharePreferences _todoSharePreferences = TodoSharePreferences();
  final String id;
  EditTodoBloc(this.id) : super(EditTodoInitial()) {
    on<EditTodoEvent>((event, emit) async {
      switch(event){
        case UpdateTodoEvent():
          await _todoSharePreferences.saveTodo(id, event.title);
          emit(UpdatedTodo());
        case LoadTodoEvent():
          String? title = await _todoSharePreferences.getTodo(event.id);
          emit(LoadedTodo(title: title ?? ''));
      }
    });
  }
}
