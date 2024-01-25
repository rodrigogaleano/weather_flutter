import 'dart:ui';

import '../../support/utils/service_locator/service_locator.dart';
import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class WeatherRoutesProtocol {
  void getCurrentWeather(Success? success, Failure? failure, VoidCallback? onComplete);
}

class WeatherRoutes extends WeatherRoutesProtocol {
  final ApiProvider _provider = ServiceLocator.get<ApiProvider>();
  
  @override
  void getCurrentWeather(Success? success, Failure? failure, VoidCallback? onComplete) {
    final endpoint = Endpoint(path: '/weather', method: 'GET', queryParameters: {},);

    _provider.request(endpoint: endpoint, success: success, failure: failure, onComplete: onComplete,);
  }
}