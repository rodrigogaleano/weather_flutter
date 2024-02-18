import '../home/models/current_weather.dart';
import '../home/models/weather_request.dart';
import '../home/use_cases/get_current_weather_use_case.dart';
import 'city_view_controller.dart';

class CityViewModel extends CityProtocol {
  /// Private Properties
  bool _isLoading = false;
  String _errorMessage = '';
  late CurrentWeather _currentWeather;

  /// Init

  final String cityName;
  final GetCurrentWeatherUseCaseProtocol getCurrentWeatherUseCase;

  CityViewModel({
    required this.cityName,
    required this.getCurrentWeatherUseCase,
  });

  /// Public Methods

  @override
  void loadContent() {
    _setLoading(true);
    getCurrentWeatherUseCase.execute(
      params: WeatherRequest(cityName: cityName),
      success: (currentWeather) {
        _currentWeather = currentWeather;
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () => _setLoading(false),
    );
  }

  /// Private Methods

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
