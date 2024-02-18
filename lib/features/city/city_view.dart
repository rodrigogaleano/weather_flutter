import 'package:flutter/material.dart';

import '../../support/components/weather_view.dart';

abstract class CityViewModelProtocol with ChangeNotifier {
  bool get isLoading;

  String get tempMax;
  String get tempMin;
  String get humidity;
  String get localName;
  String get windSpeed;
  String get description;
  String get errorMessage;
  String get currentTemperature;
  String get feelsLikeTemperature;

  void didTapFavorite();
}

class CityView extends StatelessWidget {
  final CityViewModelProtocol viewModel;

  const CityView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, __) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(viewModel.localName),
                  // TODO: Fazer feature de favoritar cidade
                  // actions: [
                  //   IconButton(
                  //     onPressed: viewModel.didTapFavorite,
                  //     icon: const Icon(Icons.bookmark_border),
                  //   ),
                  // ],
                ),
                _bodySliver,
              ],
            );
          },
        ),
      ),
    );
  }

  Widget get _bodySliver {
    if (viewModel.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(), // TODO: Achar uma animação de loading
        ),
      );
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Text(viewModel.errorMessage), // TODO: Adicionar uma imagem de erro
        ),
      );
    }

    return WeatherView(
      tempMax: viewModel.tempMax,
      tempMin: viewModel.tempMin,
      humidity: viewModel.humidity,
      localName: viewModel.localName,
      windSpeed: viewModel.windSpeed,
      description: viewModel.description,
      errorMessage: viewModel.errorMessage,
      currentTemperature: viewModel.currentTemperature,
      feelsLikeTemperature: viewModel.feelsLikeTemperature,
    );
  }
}
