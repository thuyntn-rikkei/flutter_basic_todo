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

class CheckedTodo extends TodoListEvent {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  const CheckedTodo({required this.isCompleted, required this.id, required this.title, required this.description});
  @override
  List<Object> get props => [isCompleted, id, title, description];
}


