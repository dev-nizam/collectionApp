import 'dart:convert';

import 'package:collection_app/repository/api/apiCleint.dart';
import 'package:collection_app/repository/model/SchemeModel.dart';
import 'package:http/http.dart' as http;

class ApiScheme {
  ApiClient apiClient = ApiClient();

  final String getPath2 = "get-scheme ";

  Future<SchemeModel> getScheme() async {
    print(
        "===================api get-scheme worked=============================");
    http.Response response =
        await apiClient.invokeAPI(path: getPath2, method: "GET", body: null);
    print(response.body + ">>>>>>>>>>>>>>>>>>>>>>");
    return SchemeModel.fromJson(jsonDecode(response.body));
  }
//   Future<SchemeModel> getScheme() async {
//     print("================================================");
//     var request =http.Request('GET', Uri.parse('https://testsys.yes45.in/api/get-scheme'));
//     http.StreamedResponse response = await request.send();
//     // http.Response response = await apiClient.invokeAPI(
//     //      path: getPath2, method: "GET", body: null);
//     print(await response.stream.bytesToString());
//     return SchemeModel.fromJson(json.decode(await response.stream.bytesToString()));
//   }
}
