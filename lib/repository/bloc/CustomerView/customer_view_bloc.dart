import 'package:bloc/bloc.dart';
import 'package:collection_app/repository/api/CustomerViewApi/CustomerViewApi.dart';
import 'package:collection_app/repository/model/GetCustomerModel.dart';
import 'package:meta/meta.dart';

part 'customer_view_event.dart';

part 'customer_view_state.dart';

class CustomerViewBloc extends Bloc<CustomerViewEvent, CustomerViewState> {
  late GetCustomerModel getCustomerModel;
  CustomerViewApi customerViewApi = CustomerViewApi();

  CustomerViewBloc() : super(CustomerViewInitial()) {
    on<FetchCustomerView>((event, emit) async {
      emit(CustomerViewLoading());
      try {
        getCustomerModel = await customerViewApi.getCustomerView();
        emit(CustomerViewLoaded());
      } catch (e) {
        emit(CustomerViewError());
      }

      // TODO: implement event handler
    });
  }
}
