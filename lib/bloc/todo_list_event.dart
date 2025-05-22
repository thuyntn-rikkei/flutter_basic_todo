part of 'todo_list_bloc.dart';

sealed class TodoListEvent extends Equatable {
  const TodoListEvent();
}

class LoadTodos extends TodoListEvent {
  @override
  List<Object> get props => [];
}

class DeleteTodo extends TodoListEvent {
  final String id;
  const DeleteTodo({required this.id});
  @override
  List<Object> get props => [id];
}


