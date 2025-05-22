import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/todo.dart';
import '../data/todo_share_preferences.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final TodoSharePreferences _todoSharePreferences = TodoSharePreferences();
  TodoListBloc() : super(TodoListInitial()) {
    on<TodoListEvent>((event, emit) async {
      switch(event){
        case LoadTodos():
          emit(TodoListLoading());
          Map<String, String> todos = await _todoSharePreferences.getAllTodos();
          emit(TodoListLoaded(todos: todos));
        case DeleteTodo():
          emit(TodoListLoading());
          await _todoSharePreferences.deleteTodo(event.id);
          Map<String, String> todos = await _todoSharePreferences.getAllTodos();
          emit(TodoListLoaded(todos: todos));
      }
    });
  }
}
