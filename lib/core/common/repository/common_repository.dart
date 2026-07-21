import 'dart:developer';

import 'package:get/get.dart';
import 'package:basic_setup/core/network/api_client.dart';

class CommonRepository {
  ApiClient apiClient = ApiClient();

  Future<dynamic> getRequest({required String endpoint}) async {
    try {
      log("EndPoint in CommonRepository getRequest : $endpoint");

      Response response = await apiClient.getRequest(endpoint: endpoint);

      if (response.statusCode == 200) {
        log("✅ Success : response.body : ${response.body}");
        return response.body;
      } else {
        log("🚫 In Common Repo status code : ${response.statusCode}");
        log("🚫 In Common Repo body : ${response.body}");
        return null;
      }
    } catch (e) {
      log("🚷 Exception in Common Repo : $e");
      return null;
    } finally {}
  }

  Future<dynamic> postRequest({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    try {
      log("EndPoint in CommonRepository getRequest : $endpoint");

      Response response = await apiClient.postRequest(
        endpoint: endpoint,
        body: body,
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        log("🚫 In Common Repo status code : ${response.statusCode}");
        log("🚫 In Common Repo body : ${response.body}");
        return null;
      }
    } catch (e) {
      log("🚷 Exception in Common Repo : $e");
      return null;
    } finally {}
  }
}
