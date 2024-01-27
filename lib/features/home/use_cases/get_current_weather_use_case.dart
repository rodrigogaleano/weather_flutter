import 'dart:ui';

import '../../../api/routes/weather_routes.dart';
import '../../../models/server_error.dart';
import '../models/current_weather.dart';

typedef Success = void Function(CurrentWeather currentWeather);
typedef Failure = void Function(ServerError error);

abstract class GetCurrentWeatherUseCaseProtocol {
  void execute({
    required double latitude,
    required double longitude,
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
    required double latitude,
    required double longitude,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    routes.getCurrentWeather(
      latitude: latitude,
      longitude: longitude,
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
