import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import 'home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {
  void loadContent();
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
    viewModel.loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: viewModel);
  }
}
