import 'dart:ui';

import '../../support/utils/service_locator/service_locator.dart';
import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class WeatherRoutesProtocol {
  void getCurrentWeather({
    required double latitude,
    required double longitude,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class WeatherRoutes extends WeatherRoutesProtocol {
  final ApiProvider _provider = ServiceLocator.get<ApiProvider>();

  @override
  void getCurrentWeather({
    required double latitude,
    required double longitude,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    final endpoint = Endpoint(
      path: '/weather',
      method: 'GET',
      queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'units': 'metric', // TODO: Tornar escolha do usuário (standard, metric e imperial)
      },
    );

    _provider.request(
      endpoint: endpoint,
      success: success,
      failure: failure,
      onComplete: onComplete,
    );
  }
}
