import 'dart:convert';

import 'package:collection_app/repository/api/apiCleint.dart';
import 'package:collection_app/repository/model/GetCustomerModel.dart';
import 'package:http/http.dart';

class CustomerViewApi {
  ApiClient apiClient = ApiClient();
  GetCustomerModel getCustomerModel = GetCustomerModel();
  final String Path = "get-customer";

  Future<GetCustomerModel> getCustomerView() async {
    print("get....");
    Response response =
        await apiClient.invokeAPI(path: Path, method: "GET", body: null);

    print("response worked");
    return GetCustomerModel.fromJson(json.decode(response.body));
  }
}
