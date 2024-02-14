import '../../../api/routes/cities_routes.dart';
import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../cities_view_controller.dart';
import '../cities_view_model.dart';
import '../use_cases/get_cities_use_case.dart';

class CitiesModule extends AppModule {
  @override
  void registerDependencies() {
    /// UseCases
    ServiceLocator.registerFactory<GetCitiesUseCaseProtocol>(() {
      return GetCitiesUseCase(
        routes: ServiceLocator.get<CitiesRoutesProtocol>(),
      );
    });

    /// ViewModel
    ServiceLocator.registerFactory<CitiesProtocol>(() {
      return CitiesViewModel(
        getCitiesUseCase: ServiceLocator.get<GetCitiesUseCaseProtocol>(),
      );
    });
  }
}
