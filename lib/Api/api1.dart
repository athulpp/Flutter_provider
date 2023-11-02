import 'package:dio/dio.dart';
import 'package:shop_app_flutter/Api/api_handle.dart';
import 'package:shop_app_flutter/Model/fact_model.dart';

class Api1Service {
  final HttpService _httpService = HttpService();

  Future<Fact?> callApi1() async {
    Fact? _factData;
    Response response =
        await _httpService.getRequest('https://catfact.ninja/fact');
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;
      _factData = Fact.fromJson(responseData);
      return _factData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
