part of 'log_in_bloc.dart';

sealed class LogInEvent extends Equatable {
  const LogInEvent();
}

class LoggedInEvent extends LogInEvent {
  @override
  List<Object> get props => [];
}
