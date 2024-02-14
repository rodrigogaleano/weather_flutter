import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import 'cities_view.dart';

abstract class CitiesProtocol extends CitiesViewModelProtocol {
  VoidCallback? onRemoveFocus;
}

class CitiesViewController extends StatefulWidget {
  const CitiesViewController({super.key});

  @override
  State<CitiesViewController> createState() => _CitiesViewControllerState();
}

class _CitiesViewControllerState extends State<CitiesViewController> {
  final viewModel = ServiceLocator.get<CitiesProtocol>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return CitiesView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onRemoveFocus = () {
      FocusScope.of(context).unfocus();
    };
  }
}
