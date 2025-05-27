part of 'add_new_todo_bloc.dart';

sealed class AddNewTodoEvent extends Equatable {
  const AddNewTodoEvent();
}

class SaveTodoEvent extends AddNewTodoEvent {
  final String title;
  final String description;
  final bool isCompleted;

  const SaveTodoEvent({required this.description, required this.isCompleted, required this.title});

  @override
  List<Object?> get props => [];
}

class CheckTodoEvent extends AddNewTodoEvent {
  final String title;
  final String description;
  final bool isCompleted;

  const CheckTodoEvent({required this.description, required this.isCompleted, required this.title});

  @override
  List<Object?> get props => [];
}
