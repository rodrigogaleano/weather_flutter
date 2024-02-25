import 'dart:ui';

import '../../../api/routes/weather_routes.dart';
import '../../../models/server_error.dart';
import '../models/forecast.dart';
import '../models/weather_request.dart';

typedef Success = void Function(List<Forecast> forecast);
typedef Failure = void Function(ServerError error);

abstract class GetForecastUseCaseProtocol {
  void execute({
    required WeatherRequest params,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class GetForecastUseCase extends GetForecastUseCaseProtocol {
  final WeatherRoutesProtocol routes;

  GetForecastUseCase({required this.routes});

  @override
  void execute({
    required WeatherRequest params,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    routes.getForecast(
      params: params,
      success: (response) {
        try {
          final forecast = Forecast.fromMaps(response['list']);
          success?.call(forecast);
        } on Error catch (error) {
          failure?.call(error.internalError());
        }
      },
      failure: (error) {
        failure?.call(error.asServerError());
      },
      onComplete: onComplete,
    );
  }
}
