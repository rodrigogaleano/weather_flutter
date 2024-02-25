import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';

abstract class ForecastItemViewModelProtocol {
  String get hour;
  String get temperature;
}

class ForecastItemView extends StatelessWidget {
  final ForecastItemViewModelProtocol viewModel;

  const ForecastItemView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            viewModel.hour,
            style: AppFonts.circeRegular(14, AppColors.black05),
          ),
          Text(
            viewModel.temperature,
            style: AppFonts.circeBold(18, AppColors.black),
          ),
        ],
      ),
    );
  }
}
