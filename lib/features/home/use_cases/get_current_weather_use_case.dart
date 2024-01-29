import 'dart:ui';

import '../../../api/routes/weather_routes.dart';
import '../../../models/server_error.dart';
import '../models/current_weather.dart';
import '../models/weather_request.dart';

typedef Success = void Function(CurrentWeather currentWeather);
typedef Failure = void Function(ServerError error);

abstract class GetCurrentWeatherUseCaseProtocol {
  void execute({
    required WeatherRequest params,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class GetCurrentWeatherUseCase extends GetCurrentWeatherUseCaseProtocol {
  final WeatherRoutesProtocol routes;

  GetCurrentWeatherUseCase({required this.routes});

  @override
  void execute({
    required WeatherRequest params,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    routes.getCurrentWeather(
      params: params,
      success: (response) {
        try {
          final weather = CurrentWeather.fromMap(response);
          success?.call(weather);
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
