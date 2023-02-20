import 'dart:convert';

import 'package:collection_app/repository/api/apiCleint.dart';
import 'package:collection_app/repository/model/RouteModel.dart';
import 'package:http/http.dart' as http;

class ApiId {
  ApiClient apiClient = ApiClient();
  final String getPath1 = "get-route";

  Future<RouteModel> getRoute() async {
    http.Response response =
        await apiClient.invokeAPI(path: getPath1, method: "GET", body: null);
    print(response.body + ">>>>>>>>ggggggggggggggg>>>>>>>>>>>>>>");
    return RouteModel.fromJson(jsonDecode(response.body));
  }
// Future<SchemeModel> getScheme() async {
//   print("================================================");
//  var request =http.Request('GET', Uri.parse('https://testsys.yes45.in/api/get-scheme'));
//  http.StreamedResponse response = await request.send();
//  // http.Response response = await apiClient.invokeAPI(
//  //      path: getPath2, method: "GET", body: null);
//   print(await response.stream.bytesToString());
//   return SchemeModel.fromJson(json.decode(await response.stream.bytesToString()));
// }
// Future<PlaceModel> getPlace() async {
//   Response response = await apiClient.invokeAPI(
//       path: getPath3, method: "GET", body: null);
//   return PlaceModel.fromJson(response.body);
// }
}
