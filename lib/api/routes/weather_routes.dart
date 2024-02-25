import 'dart:ui';

import '../../features/home/models/weather_request.dart';
import '../../support/utils/service_locator/service_locator.dart';
import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class WeatherRoutesProtocol {
  void getCurrentWeather({
    required WeatherRequest params,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
  void getForecast({
    required WeatherRequest params,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class WeatherRoutes extends WeatherRoutesProtocol {
  final ApiProvider _provider = ServiceLocator.get<ApiProvider>();

  @override
  void getCurrentWeather({
    required WeatherRequest params,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    final endpoint = Endpoint(
      path: '/weather',
      method: 'GET',
      queryParameters: params.toMap(),
    );

    _provider.request(
      endpoint: endpoint,
      success: success,
      failure: failure,
      onComplete: onComplete,
    );
  }

  @override
  void getForecast({
    required WeatherRequest params,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    final endpoint = Endpoint(
      path: '/forecast',
      method: 'GET',
      queryParameters: params.toMap(),
    );

    _provider.request(
      endpoint: endpoint,
      success: success,
      failure: failure,
      onComplete: onComplete,
    );
  }
}
