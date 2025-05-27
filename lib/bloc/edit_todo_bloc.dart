import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/todo.dart';
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
          await _todoSharePreferences.saveTodo(
              id,
              Todo(id: id, title: event.title, description: event.description, isCompleted: event.isCompleted)
          );
          emit(UpdatedTodo());
        case LoadTodoEvent():
          Todo? todo = await _todoSharePreferences.getTodo(id);
          if(todo == null){
            emit(ErrorTodo());
            return;
          }
          print(todo.toJson());
          emit(LoadedTodo(title: todo.title, description: todo.description, isCompleted: todo.isCompleted, id: id));
        case CheckedTodoEvent():
          emit(LoadedTodo(title: event.title, description: event.description, isCompleted: event.isCompleted, id: id));
      }
    });
  }
}
