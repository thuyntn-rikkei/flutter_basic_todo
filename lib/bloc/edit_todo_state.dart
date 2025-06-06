part of 'edit_todo_bloc.dart';

sealed class EditTodoState extends Equatable {
  const EditTodoState();
}

final class EditTodoInitial extends EditTodoState {

  @override
  List<Object> get props => [];
}

final class LoadedTodo extends EditTodoState {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  const LoadedTodo({required this.title, required this.description, required this.isCompleted, required this.id});
  @override
  List<Object> get props => [title, description, isCompleted, id];
}

final class UpdatedTodo extends EditTodoState {
  @override
  List<Object> get props => [];
}

final class ErrorTodo extends EditTodoState {
  @override
  List<Object> get props => [];
}

