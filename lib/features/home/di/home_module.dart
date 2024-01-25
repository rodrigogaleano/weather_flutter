import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';

class HomeModule extends AppModule {
  @override
  void registerDependencies() {
    /// ViewModel
    ServiceLocator.registerFactory<HomeProtocol>(() {
      return HomeViewModel();
    });
  }
}