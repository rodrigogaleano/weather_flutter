import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/mobile_router.dart';
import '../../support/utils/service_locator/service_locator.dart';
import 'home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {
  Future<void> loadContent();

  VoidCallback? onTapCitiesList;
}

class HomeViewController extends StatefulWidget {
  const HomeViewController({super.key});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  final viewModel = ServiceLocator.get<HomeProtocol>();

  @override
  void initState() {
    super.initState();
    _bind();
    viewModel.loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapCitiesList = () {
      context.goNamed(MobileRouter.citiesListRoute);
    };
  }
}
