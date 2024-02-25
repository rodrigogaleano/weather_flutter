import '../../support/components/forecast_item/forecast_item_view.dart';
import '../../support/components/forecast_item/forecast_item_view_model.dart';
import '../../support/extensions/double.dart';
import '../../support/utils/geo_locator/geo_locator_provider.dart';
import 'home_view_controller.dart';
import 'models/current_weather.dart';
import 'models/forecast.dart';
import 'models/weather_request.dart';
import 'use_cases/get_current_weather_use_case.dart';
import 'use_cases/get_forecast_use_case.dart';

class HomeViewModel extends HomeProtocol {
  /// Private Properties

  bool _isForecastLoading = true;
  bool _isCurrentWeatherLoading = true;
  String _errorMessage = '';
  late double _latitude;
  late double _longitude;
  late List<Forecast> _forecast;
  late CurrentWeather _currentWeather;

  /// Init

  final GeoLocatorProviderProtocol geoLocatorProvider;
  final GetForecastUseCaseProtocol getForecastUseCase;
  final GetCurrentWeatherUseCaseProtocol getCurrentWeatherUseCase;

  HomeViewModel({
    required this.getForecastUseCase,
    required this.geoLocatorProvider,
    required this.getCurrentWeatherUseCase,
  });

  /// Public Getters

  @override
  bool get isLoading => _isForecastLoading || _isCurrentWeatherLoading;

  @override
  String get errorMessage => _errorMessage;

  @override
  String get humidity => '${_currentWeather.humidity}%';

  @override
  String get localName => _currentWeather.localName.toLowerCase();

  @override
  String get description => _currentWeather.description.toLowerCase();

  // TODO: remover se não for usar
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

  @override
  List<ForecastItemViewModelProtocol> get forecastViewModels {
    return _forecast.map((forecast) {
      return ForecastItemViewModel(forecast: forecast);
    }).toList();
  }

  /// Public Methods

  @override
  Future<void> loadContent() async {
    await geoLocatorProvider.getCurrentPosition(
      success: (position) {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _getCurrentWeather();
        _getForecast();
      },
      failure: () {
        _errorMessage = 'Acesso à localização negado'; // TODO: String no l10n
        _setForecastLoading(false);
        _setCurrentWeatherLoading(false);
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
      params: WeatherRequest(latitude: _latitude, longitude: _longitude),
      success: (currentWeather) {
        _currentWeather = currentWeather;
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () => _setCurrentWeatherLoading(false),
    );
  }

  void _getForecast() {
    if (_errorMessage.isNotEmpty) _errorMessage = '';
    getForecastUseCase.execute(
      params: WeatherRequest(
        count: 12, // TODO: Colocar numa constante
        latitude: _latitude,
        longitude: _longitude,
      ),
      success: (forecast) {
        _forecast = forecast;
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () => _setForecastLoading(false),
    );
  }

  void _setCurrentWeatherLoading(bool loadingStatus) {
    _isCurrentWeatherLoading = loadingStatus;
    notifyListeners();
  }

  void _setForecastLoading(bool loadingStatus) {
    _isForecastLoading = loadingStatus;
    notifyListeners();
  }
}
