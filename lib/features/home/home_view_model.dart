import '../../support/extensions/double.dart';
import '../../support/utils/geo_locator/geo_locator_provider.dart';
import 'home_view_controller.dart';
import 'models/current_weather.dart';
import 'models/weather_request.dart';
import 'use_cases/get_current_weather_use_case.dart';

class HomeViewModel extends HomeProtocol {
  /// Private Properties

  bool _isLoading = false;
  String _errorMessage = '';
  late CurrentWeather _currentWeather;
  late WeatherRequest _weatherRequest;

  /// Init

  final GeoLocatorProviderProtocol geoLocatorProvider;
  final GetCurrentWeatherUseCaseProtocol getCurrentWeatherUseCase;

  HomeViewModel({
    required this.geoLocatorProvider,
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
  String get localName => _currentWeather.localName.toLowerCase();

  @override
  String get description => _currentWeather.description.toLowerCase();

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
  Future<void> loadContent() async {
    _setLoading(true);
    await geoLocatorProvider.getCurrentPosition(
      success: (position) {
        _weatherRequest = WeatherRequest(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        _getCurrentWeather();
      },
      failure: () {
        _errorMessage = 'Acesso à localização negado';
        _setLoading(false);
      },
    );
  }

  @override
  void didTapCitiesList() {
    onTapCitiesList?.call();
  }

  /// Private Methods

  void _getCurrentWeather() {
    if (_errorMessage.isNotEmpty) _errorMessage = '';
    getCurrentWeatherUseCase.execute(
      params: _weatherRequest,
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
