part of 'user_id_bloc.dart';

@immutable
abstract class UserIdEvent {}

class FetchRoute extends UserIdEvent {}

class FetchPlace extends UserIdEvent {}

class FetchPayment extends UserIdEvent {}
