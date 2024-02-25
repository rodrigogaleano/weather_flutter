import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../../home/use_cases/get_current_weather_use_case.dart';
import '../../home/use_cases/get_forecast_use_case.dart';
import '../city_view_controller.dart';
import '../city_view_model.dart';

class CityModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactoryParam<CityProtocol, String>((cityName) {
      return CityViewModel(
        cityName: cityName,
        getForecastUseCase: ServiceLocator.get<GetForecastUseCaseProtocol>(),
        getCurrentWeatherUseCase: ServiceLocator.get<GetCurrentWeatherUseCaseProtocol>(),
      );
    });
  }
}
