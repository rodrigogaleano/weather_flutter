import '../../../api/routes/weather_routes.dart';
import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';
import '../use_cases/get_current_weather_use_case.dart';

class HomeModule extends AppModule {
  @override
  void registerDependencies() {
    /// Use Cases
    ServiceLocator.registerFactory<GetCurrentWeatherUseCaseProtocol>(() {
      return GetCurrentWeatherUseCase(
        routes: ServiceLocator.get<WeatherRoutesProtocol>(),
      );
    });

    /// ViewModel
    ServiceLocator.registerFactory<HomeProtocol>(() {
      return HomeViewModel(
        getCurrentWeatherUseCase: ServiceLocator.get<GetCurrentWeatherUseCaseProtocol>(),
      );
    });
  }
}
