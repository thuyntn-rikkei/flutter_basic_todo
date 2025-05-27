part of 'add_new_todo_bloc.dart';

sealed class AddNewTodoState extends Equatable {
  const AddNewTodoState();
}

final class SavedTodo extends AddNewTodoState {
  @override
  List<Object> get props => [];
}

final class CheckedTodo extends AddNewTodoState {
  final bool isCompleted;

  const CheckedTodo({required this.isCompleted});

  @override
  List<Object> get props => [isCompleted];
}