import '../../support/extensions/double.dart';
import '../../support/utils/constants.dart';
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
  bool get isLoading => _isLoading;

  @override
  String get errorMessage => _errorMessage;

  @override
  String get humidity => '${_currentWeather?.humidity}%';

  @override
  String get localName => _currentWeather?.localName ?? '';

  @override
  String get description => _currentWeather?.description ?? '';

  @override
  String get iconPath => Constants.openWeatherIconBaseUrl(_currentWeather?.icon);

  @override
  String get currentTemperature => '${_currentWeather?.temperature.round()}\u00B0';

  @override
  String get windSpeed => '${_currentWeather?.windSpeed.toKilometerPerHour()}km/h';

  @override
  void loadContent() {
    _setLoading(true);
    getCurrentWeatherUseCase.execute(
      // TODO: Solicitar localização do usuário
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
