part of 'edit_todo_bloc.dart';

sealed class EditTodoEvent extends Equatable {
  const EditTodoEvent();
}

class UpdateTodoEvent extends EditTodoEvent {
  final String title;
  final String description;
  final bool isCompleted;

  const UpdateTodoEvent({required this.description, required this.title, required this.isCompleted});

  @override
  List<Object?> get props => [title];

}

class LoadTodoEvent extends EditTodoEvent {
  const LoadTodoEvent();
  @override
  List<Object?> get props => [];
}

class CheckedTodoEvent extends EditTodoEvent {
  final String title;
  final String description;
  final bool isCompleted;
  const CheckedTodoEvent({required this.isCompleted, required this.title, required this.description});
  @override
  List<Object?> get props => [isCompleted, title, description];
}