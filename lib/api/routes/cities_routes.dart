import 'dart:ui';

import '../../support/utils/service_locator/service_locator.dart';
import '../setup/api_host.dart';
import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class CitiesRoutesProtocol {
  void getCitiesList({
    required String query,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class CitiesRoutes extends CitiesRoutesProtocol {
  final ApiProvider _provider = ServiceLocator.get<ApiProvider>();

  @override
  void getCitiesList({
    required String query,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    final endpoint = Endpoint(
      baseUrl: ApiHost.geoBaseUrl,
      path: '/direct',
      method: 'GET',
      queryParameters: {
        'q': query,
        'limit': 5,
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
