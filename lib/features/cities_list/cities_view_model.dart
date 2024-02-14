import 'package:flutter/material.dart';

import '../../support/utils/debouncer.dart';
import 'cities_view_controller.dart';
import 'components/city_item/city_item_view.dart';
import 'components/city_item/city_item_view_model.dart';
import 'models/city.dart';
import 'use_cases/get_cities_use_case.dart';

class CitiesViewModel extends CitiesProtocol {
  /// Private Properties
  String _searchQuery = '';
  bool _isLoading = false;
  String _errorMessage = '';
  final List<City> _cities = [];
  final _debouncer = Debouncer(milliseconds: 1500);
  final _searchBarController = TextEditingController();

  /// Init

  final GetCitiesUseCaseProtocol getCitiesUseCase;

  CitiesViewModel({required this.getCitiesUseCase}) {
    _searchBarController.addListener(() {
      _searchQuery = _searchBarController.text;
      if (_searchQuery.isNotEmpty) {
        _debouncer.run(_getCities);
      }
      notifyListeners();
    });
  }

  /// Public Getters

  @override
  bool get isLoading => _isLoading;

  @override
  String get errorMessage => _errorMessage;

  @override
  TextEditingController get searchBarController => _searchBarController;

  @override
  List<CityItemViewModelProtocol> get cityViewModels {
    return _cities.map((city) {
      return CityItemViewModel(city: city);
    }).toList();
  }

  /// Public Methods

  void _getCities() {
    _errorMessage = '';
    _cities.clear();
    _setLoading(true);
    getCitiesUseCase.execute(
      query: _searchQuery,
      success: (cities) {
        _cities.addAll(cities);
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () => _setLoading(false),
    );
  }

  @override
  void removeFocus() {
    onRemoveFocus?.call();
  }

  /// Private Methods

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
