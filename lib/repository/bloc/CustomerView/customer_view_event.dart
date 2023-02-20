part of 'customer_view_bloc.dart';

@immutable
abstract class CustomerViewEvent {}

class FetchCustomerView extends CustomerViewEvent {}
