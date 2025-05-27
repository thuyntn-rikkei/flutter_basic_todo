part of 'log_in_bloc.dart';

sealed class LogInState extends Equatable {
  const LogInState();
}

final class LogInInitial extends LogInState {
  @override
  List<Object> get props => [];
}
