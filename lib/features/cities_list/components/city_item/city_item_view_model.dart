import '../../models/city.dart';
import 'city_item_view.dart';

class CityItemViewModel extends CityItemViewModelProtocol {
  /// Init

  final City city;

  CityItemViewModel({required this.city});

  /// Public Getters

  @override
  String get name => city.name;

  @override
  String get details => '${city.state}, ${city.country}';

  /// Public Methods

  @override
  void didTapCity() {
    // TODO: Implementar metodo
  }
}
