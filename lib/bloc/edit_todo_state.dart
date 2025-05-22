part of 'edit_todo_bloc.dart';

sealed class EditTodoState extends Equatable {
  const EditTodoState();
}

final class EditTodoInitial extends EditTodoState {

  @override
  List<Object> get props => [];
}

final class LoadedTodo extends EditTodoState {
  final String title;

  const LoadedTodo({required this.title});
  @override
  List<Object> get props => [title];
}

final class UpdatedTodo extends EditTodoState {
  @override
  List<Object> get props => [];
}

