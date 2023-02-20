part of 'user_id_bloc.dart';

@immutable
abstract class UserIdState {}

class UserIdInitial extends UserIdState {}

class UserIdLoading extends UserIdState {}

class UserIdLoaded extends UserIdState {}

class UserIdError extends UserIdState {}
