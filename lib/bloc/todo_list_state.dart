part of 'todo_list_bloc.dart';

sealed class TodoListState extends Equatable {
  const TodoListState();
}

final class TodoListInitial extends TodoListState {
  @override
  List<Object> get props => [];
}

final class TodoListLoading extends TodoListState {
  @override
  List<Object> get props => [];
}

final class TodoListLoaded extends TodoListState {
  final List<Todo> todos;

  const TodoListLoaded({required this.todos});

  @override
  List<Object> get props => [todos];
}

