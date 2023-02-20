part of 'scheme_bloc.dart';

@immutable
abstract class SchemeState {}

class SchemeInitial extends SchemeState {}

class SchemeLoading extends SchemeState {}

class SchemeLoaded extends SchemeState {}

class SchemeError extends SchemeState {}
