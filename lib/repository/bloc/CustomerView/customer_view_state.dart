part of 'customer_view_bloc.dart';

@immutable
abstract class CustomerViewState {}

class CustomerViewInitial extends CustomerViewState {}

class CustomerViewLoading extends CustomerViewState {}

class CustomerViewLoaded extends CustomerViewState {}

class CustomerViewError extends CustomerViewState {}
