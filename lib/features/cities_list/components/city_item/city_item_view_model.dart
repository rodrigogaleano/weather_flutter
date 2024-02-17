import '../../models/city.dart';
import 'city_item_view.dart';

abstract class CityItemDelegate {
  void didTapCity({required String cityName});
}

class CityItemViewModel extends CityItemViewModelProtocol {
  /// Init

  final City city;
  final CityItemDelegate delegate;

  CityItemViewModel({required this.city, required this.delegate});

  /// Public Getters

  @override
  String get name => city.name;

  @override
  String get details => '${city.state}, ${city.country}';

  /// Public Methods

  @override
  void didTapCity() {
    delegate.didTapCity(cityName: city.name);
  }
}
