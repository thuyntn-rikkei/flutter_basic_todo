part of 'add_new_todo_bloc.dart';

sealed class AddNewTodoEvent extends Equatable {
  const AddNewTodoEvent();
}

class SaveTodoEvent extends AddNewTodoEvent {
  final String title;

  const SaveTodoEvent({required this.title});

  @override
  List<Object?> get props => [];
}
