import '../../../api/routes/weather_routes.dart';
import '../../../support/utils/geo_locator/geo_locator_provider.dart';
import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';
import '../use_cases/get_current_weather_use_case.dart';
import '../use_cases/get_forecast_use_case.dart';

class HomeModule extends AppModule {
  @override
  void registerDependencies() {
    /// Routes
    final weatherRoutes = ServiceLocator.get<WeatherRoutesProtocol>();

    /// Use Cases
    ServiceLocator.registerFactory<GetForecastUseCaseProtocol>(() {
      return GetForecastUseCase(routes: weatherRoutes);
    });

    ServiceLocator.registerFactory<GetCurrentWeatherUseCaseProtocol>(() {
      return GetCurrentWeatherUseCase(
        routes: weatherRoutes,
      );
    });

    /// ViewModel
    ServiceLocator.registerFactory<HomeProtocol>(() {
      return HomeViewModel(
        geoLocatorProvider: ServiceLocator.get<GeoLocatorProviderProtocol>(),
        getForecastUseCase: ServiceLocator.get<GetForecastUseCaseProtocol>(),
        getCurrentWeatherUseCase: ServiceLocator.get<GetCurrentWeatherUseCaseProtocol>(),
      );
    });
  }
}
