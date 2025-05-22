part of 'edit_todo_bloc.dart';

sealed class EditTodoEvent extends Equatable {
  const EditTodoEvent();
}

class UpdateTodoEvent extends EditTodoEvent {
  final String title;

  const UpdateTodoEvent({required this.title});

  @override
  List<Object?> get props => [title];

}

class LoadTodoEvent extends EditTodoEvent {
  final String id;
  const LoadTodoEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
