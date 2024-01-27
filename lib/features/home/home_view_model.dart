import 'home_view_controller.dart';
import 'models/current_weather.dart';
import 'use_cases/get_current_weather_use_case.dart';

class HomeViewModel extends HomeProtocol {
  bool _isLoading = false;
  String _errorMessage = '';
  CurrentWeather? _currentWeather;

  final GetCurrentWeatherUseCaseProtocol getCurrentWeatherUseCase;

  HomeViewModel({required this.getCurrentWeatherUseCase});

  @override
  void loadContent() {
    _setLoading(true);
    getCurrentWeatherUseCase.execute(
      latitude: -22.5365,
      longitude: -55.7267,
      success: (currentWeather) {
        _currentWeather = currentWeather;
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () => _setLoading(false),
    );
  }

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
