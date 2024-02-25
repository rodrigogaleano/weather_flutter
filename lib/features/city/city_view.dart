import 'package:flutter/material.dart';

import '../../support/components/forecast_item/forecast_item_view.dart';
import '../../support/components/weather_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

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

  List<ForecastItemViewModelProtocol> get forecastViewModels;

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
                  centerTitle: true,
                  toolbarHeight: 100,
                  title: _appBarTitle,
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

  Widget get _appBarTitle {
    if (viewModel.isLoading) {
      return const SizedBox.shrink();
    }

    return Text(
      viewModel.localName,
      style: AppFonts.circeBold(36, AppColors.black),
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
      forecastViewModels: viewModel.forecastViewModels,
      feelsLikeTemperature: viewModel.feelsLikeTemperature,
    );
  }
}
