import 'package:bloc/bloc.dart';
import 'package:collection_app/repository/api/costomerRegisterApi/ApiId.dart';
import 'package:collection_app/repository/model/RouteModel.dart';
import 'package:meta/meta.dart';

part 'user_id_event.dart';

part 'user_id_state.dart';

class UserIdBloc extends Bloc<UserIdEvent, UserIdState> {
  late RouteModel routeModel;
  ApiId apiId = ApiId();

  UserIdBloc() : super(UserIdInitial()) {
    on<FetchRoute>((event, emit) async {
      emit(UserIdLoading());
      try {
        routeModel = await apiId.getRoute();
        emit(UserIdLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>$e");
        emit(UserIdError());
      }

      // TODO: implement event handler
    });

    // on<FetchRoute>((event, emit) async {
    //   emit(UserIdLoading());
    //   try {
    //     routeModel = await apiId.getRoute();
    //     emit(UserIdLoaded());
    //   } catch (e) {
    //     print(">>>>>>>>>>>>>$e");
    //     emit(UserIdError());
    //   }
    //
    //   // TODO: implement event handler
    // });
    // on<FetchRoute>((event, emit) async {
    //   emit(UserIdLoading());
    //   try {
    //     routeModel = await apiId.getRoute();
    //     emit(UserIdLoaded());
    //   } catch (e) {
    //     print(">>>>>>>>>>>>>$e");
    //     emit(UserIdError());
    //   }
    //
    //   // TODO: implement event handler
    // });
  }
}
