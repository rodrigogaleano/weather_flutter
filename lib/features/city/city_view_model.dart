import '../../support/extensions/double.dart';
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

  /// Public Getters

  @override
  bool get isLoading => _isLoading;

  @override
  String get errorMessage => _errorMessage;

  @override
  String get humidity => '${_currentWeather.humidity}%';

  @override
  String get localName => _currentWeather.localName;

  @override
  String get description => _currentWeather.description;

  // @override
  // String get iconPath => Constants.openWeatherIconBaseUrl(_currentWeather.icon);

  @override
  String get currentTemperature => '${_currentWeather.temperature.round()}\u00B0';

  @override
  String get windSpeed => '${_currentWeather.windSpeed.toKilometerPerHour()}km/h';

  @override
  String get feelsLikeTemperature => '${_currentWeather.feelsLike.round()}\u00B0'; // TODO: l10n

  @override
  String get tempMin => '${_currentWeather.tempMin.round()}\u00B0';

  @override
  String get tempMax => '${_currentWeather.tempMax.round()}\u00B0';

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

  @override
  void didTapFavorite() {
    // TODO: implement didTapFavorite
  }

  /// Private Methods

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
