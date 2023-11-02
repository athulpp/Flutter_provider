import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shop_app_flutter/Api/api1.dart';
import 'package:shop_app_flutter/Model/fact_model.dart';

class APIProvider extends ChangeNotifier {
  final Api1Service _api1Service = Api1Service();
  Fact? _factData;

  Fact? get factData => _factData;

  Future<Fact> getApi1Data() async {
    if (_factData == null) {
      _factData = await _api1Service.callApi1();
      notifyListeners();
    }
    return _factData!;
  }
}
