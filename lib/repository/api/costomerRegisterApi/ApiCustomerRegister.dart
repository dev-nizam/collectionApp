import 'dart:convert';

import 'package:collection_app/repository/api/apiCleint.dart';
import 'package:collection_app/repository/model/CustomerRegisterModel.dart';
import 'package:http/http.dart';

class ApiCustomerRegister {
  ApiClient apiClient = ApiClient();
  CostomerRegisterModel costomerRegisterModel = CostomerRegisterModel();
  final String loginPath = "create-customer";

  Future<CostomerRegisterModel> getLogin(
      {required mobile, required password}) async {
    final body = {
      "mob_no": mobile,
      "password": password,
    };

    print("getlogin....");
    Response response =
        await apiClient.invokeAPI(path: loginPath, method: "LOGIN", body: body);

    print("response worked");
    return CostomerRegisterModel.fromJson(json.decode(response.body));
  }
}
