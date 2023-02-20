import 'package:bloc/bloc.dart';
import 'package:collection_app/repository/api/costomerRegisterApi/SchemeApi.dart';
import 'package:collection_app/repository/model/SchemeModel.dart';
import 'package:meta/meta.dart';

part 'scheme_event.dart';

part 'scheme_state.dart';

class SchemeBloc extends Bloc<SchemeEvent, SchemeState> {
  late SchemeModel schemeeModel;

  ApiScheme apiScheme = ApiScheme();

  SchemeBloc() : super(SchemeInitial()) {
    on<FetchScheme>((event, emit) async {
      emit(SchemeLoading());
      try {
        schemeeModel = await apiScheme.getScheme();
        emit(SchemeLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>$e");
        emit(SchemeError());
      }

      // TODO: implement event handler
    });
  }
}
