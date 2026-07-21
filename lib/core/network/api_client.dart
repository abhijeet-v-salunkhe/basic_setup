import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:basic_setup/core/common/services/shared_preferences_service.dart';
import 'package:basic_setup/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect {
  static final ApiClient _singleton = ApiClient._internal();
  late String _baseUrl;

  //Todo: base url setup
  ApiClient._internal() {
    if (kDebugMode) {
      _baseUrl = "https://backendurl.com/"; // for development time
    } else {
      _baseUrl = "https://backendurl.com/";
      ; // for release time
    }
  }

  //Todo: Factory constructor to return the singleton instance
  factory ApiClient() {
    return _singleton;
  }

  Future<dynamic> getRequest({required String endpoint}) async {
    try {
      Map<String, String> header = await _getHeaders();

      http.Response response = await http.get(getUri(endpoint));
      return response;
    } on SocketException {
      log("🚫 Network Error : No Internet Connection");
      return Response(
        statusCode: 503,
        body: {"message", "No Internet Connection"},
      );
    } catch (e) {
      log("🚫 Exception in getRequest : $e");
      return Response(
        statusCode: 500,
        body: {"message": "Something went wrong"},
      );
    }
  }

  Future<dynamic> postRequest({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    try {
      Map<String, String> header = await _getHeaders();
      http.Response response = await http.post(
        getUri(endpoint),
        headers: header,
        body: body,
      );
      log(">>>>>>>>>>>>Response in postRequest : ${response.body}");
      return response;
    } on SocketException {
      log("🚫 Network Error : No Internet Connection");
      return Response(
        statusCode: 503,
        body: {"message", "No Internet Connection"},
      );
    } catch (e) {
      log("🚷 Exception in postRequest : $e");
      return Response(
        statusCode: 500,
        body: {"message": "Something went wrong"},
      );
    }
  }

  Future<Map<String, String>> _getHeaders() async {
    final token = await getToken();
    debugPrint("Current access token is : $token");
    if (token.isEmpty) {
      log("Token is empty");
    } else {
      log("Token is : $token");
    }

    return {
      if (token.isNotEmpty) "Authorization": "Bearer $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Package-name": "com.example.pm",
    };
  }

  Future<String> getToken() async {
    String? token = await SharedPreferencesService.getString(accessToken);
    return token;
  }

  Uri getUri(String endpoint) {
    var url = Uri.https(_baseUrl, endpoint);
    return url;
  }
}
