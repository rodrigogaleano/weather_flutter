import 'dart:ui';

import '../../../api/routes/cities_routes.dart';
import '../../../models/server_error.dart';
import '../models/city.dart';

typedef Success = void Function(List<City> cities);
typedef Failure = void Function(ServerError error);

abstract class GetCitiesUseCaseProtocol {
  void execute({
    required query,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class GetCitiesUseCase extends GetCitiesUseCaseProtocol {
  final CitiesRoutesProtocol routes;

  GetCitiesUseCase({required this.routes});

  @override
  void execute({
    required query,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    routes.getCitiesList(
      query: query,
      success: (response) {
        try {
          final cities = City.fromMaps(response);
          success?.call(cities);
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
