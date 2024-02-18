import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import 'city_view.dart';

abstract class CityProtocol extends CityViewModelProtocol {
  void loadContent();
}

class CityViewController extends StatefulWidget {
  final String cityName;

  const CityViewController({required this.cityName, super.key});

  @override
  State<CityViewController> createState() => _CityViewControllerState();
}

class _CityViewControllerState extends State<CityViewController> {
  late final CityProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<CityProtocol>(param: widget.cityName);
    viewModel.loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return const CityView();
  }
}
