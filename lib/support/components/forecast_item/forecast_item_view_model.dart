import '../../../features/home/models/forecast.dart';
import '../../extensions/string.dart';
import 'forecast_item_view.dart';

class ForecastItemViewModel extends ForecastItemViewModelProtocol {
  /// Init

  final Forecast forecast;

  ForecastItemViewModel({required this.forecast});

  /// Public Getters

  @override
  String get hour => forecast.dateTime.toForecastDateTime();

  @override
  String get temperature => '${forecast.temp.round().toString()}\u00B0';
}
