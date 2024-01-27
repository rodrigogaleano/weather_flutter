import 'package:flutter/material.dart';

import '../../support/style/app_assets.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

abstract class HomeViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  String get humidity;
  String get iconPath;
  String get localName;
  String get windSpeed;
  String get description;
  String get errorMessage;
  String get currentTemperature;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, __) {
            return _bodyWidget;
          },
        ),
      ),
    );
  }

  Widget get _bodyWidget {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return Center(
        child: Text(viewModel.errorMessage),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AppAssets.icMarker,
                width: 32,
              ),
              const SizedBox(width: 16),
              Text(
                viewModel.localName,
                style: AppFonts.poppinsSemiBold(24, AppColors.darkGray),
              ),
            ],
          ),
          const Spacer(),
          Image.network(viewModel.iconPath),
          Text(
            viewModel.description,
            style: AppFonts.poppinsSemiBold(18, AppColors.darkGray),
          ),
          Text(
            viewModel.currentTemperature,
            style: AppFonts.poppinsSemiBold(72, AppColors.darkGray),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.icWind,
                width: 16,
              ),
              const SizedBox(width: 8),
              Text(
                viewModel.windSpeed,
                style: AppFonts.poppinsRegular(14, AppColors.darkGray),
              ),
              const SizedBox(width: 16),
              Image.asset(
                AppAssets.icHumidity,
                width: 16,
              ),
              const SizedBox(width: 8),
              Text(
                viewModel.humidity,
                style: AppFonts.poppinsRegular(14, AppColors.darkGray),
              )
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
