import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../infrastructure/shared_preferences.dart';
import '../error/app_exception.dart';
import '../error/error_model.dart';
import '../service_locator/dependency_injection.dart';
import 'api_controller.dart';

class HttpController extends ApiController {
  late String myToken;
  HttpController(){
    myToken = getIt<SharedPrefController>().getData(key: Keys.token) ?? "null";
  }

  @override
  Future<Map<String, dynamic>> get(String uri) async {
    http.Response response = await http.get(Uri.parse(uri), headers: {
      "Content-Type": "application/json",
      'Authorization': "Bearer $myToken",
    }).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> post(String uri, {required Map<String, dynamic> body}) async {
    http.Response response = await http.post(Uri.parse(uri), headers: {
      "Content_Type": "application/json",
      "Authorization": "Bearer $myToken",
    },
      body: body,
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> put(String uri, {required Map<String, dynamic> body}) async {
    http.Response response = await http.put(Uri.parse(uri), headers: {
      "Content_Type": "application/json",
      "Authorization": "Bearer $myToken",
    },
    body: body,
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> patch(String uri, {required Map<String, dynamic> body}) async {
    http.Response response = await http.patch(Uri.parse(uri), headers: {
      "Content_Type": "application/json",
      "Authorization": "Bearer $myToken",
    },
      body: body,
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> delete(String uri, {required Map<String, dynamic> body}) async {
    http.Response response = await http.delete(Uri.parse(uri), headers: {
      "Content_Type": "application/json",
      "Authorization": "Bearer $myToken",
    },
      body: body,
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeOutException(),
    );

    return _handleResponse(response);
  }


  static Map<String, dynamic> _handleResponse(http.Response response) {
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    log("Status Code is: ${response.statusCode}");
    log("Response body is: ${response.body}");
    switch (response.statusCode) {
      case >= 200 && < 300:
        return responseMap;
      case 400:
        throw WrongInputDataException(errorModel: ErrorModel.fromJson(responseMap));
      case 401:
      case 403:
        throw UnauthorisedException(errorModel: ErrorModel.fromJson(responseMap));
      case 500:
        throw ServerException(errorModel: ErrorModel.fromJson(responseMap));
      default:
        throw UnexpectedException(errorModel: ErrorModel.fromJson(responseMap));
    }
  }

}
