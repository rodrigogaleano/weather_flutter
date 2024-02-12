import 'package:flutter/material.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

abstract class HomeViewModelProtocol with ChangeNotifier {
  bool get isLoading;

  String get temMin;
  String get tempMax;
  String get humidity;
  String get localName;
  String get windSpeed;
  String get description;
  String get errorMessage;
  String get currentTemperature;
  String get feelsLikeTemperature;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // TODO: Mover para o app assets
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, __) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: const Text('Your location'),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.list),
                    ),
                  ],
                ),
                ..._bodySlivers
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> get _bodySlivers {
    if (viewModel.isLoading) {
      return [
        const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(), // TODO: Achar uma animação de loading
          ),
        ),
      ];
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return [
        SliverFillRemaining(
          child: Center(
            child: Text(viewModel.errorMessage), // TODO: Adicionar uma imagem de erro
          ),
        )
      ];
    }

    return [
      SliverFillRemaining(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                viewModel.localName,
                style: AppFonts.circeLight(16, AppColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        viewModel.currentTemperature,
                        style: AppFonts.circeBold(96, AppColors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          viewModel.description,
                          style: AppFonts.circeLight(18, AppColors.black),
                        ),
                        Wrap(
                          children: [
                            Text(
                              'Feels like ',
                              style: AppFonts.circeLight(18, AppColors.black),
                            ),
                            Text(
                              viewModel.feelsLikeTemperature,
                              style: AppFonts.circeBold(18, AppColors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Divider(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text('Humidity'),
                        const SizedBox(width: 12),
                        Text(
                          viewModel.humidity,
                          style: AppFonts.circeBold(16, AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text('Wind'),
                        const SizedBox(width: 12),
                        Text(
                          viewModel.windSpeed,
                          style: AppFonts.circeBold(16, AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    ];
  }
}
