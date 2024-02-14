import '../../../api/routes/cities_routes.dart';
import '../../../api/routes/weather_routes.dart';
import '../../../api/setup/api_provider.dart';
import '../geo_locator/geo_locator_provider.dart';
import 'app_module.dart';
import 'service_locator.dart';

class CommonsModule extends AppModule {
  @override
  void registerDependencies() {
    /// API Routes
    ServiceLocator.registerFactory<WeatherRoutesProtocol>(() => WeatherRoutes());
    ServiceLocator.registerFactory<CitiesRoutesProtocol>(() => CitiesRoutes());

    /// Singletons
    ServiceLocator.registerSingleton<ApiProvider>(ApiProvider.instance);
    ServiceLocator.registerFactory<GeoLocatorProviderProtocol>(() => GeoLocatorProvider());
  }
}
