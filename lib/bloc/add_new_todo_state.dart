part of 'add_new_todo_bloc.dart';

sealed class AddNewTodoState extends Equatable {
  const AddNewTodoState();
}

final class AddNewTodoInitial extends AddNewTodoState {
  @override
  List<Object> get props => [];
}

final class SavedTodo extends AddNewTodoState {
  @override
  List<Object> get props => [];
}