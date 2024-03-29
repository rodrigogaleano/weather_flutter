import 'package:flutter/material.dart';

import '../../../../support/style/app_colors.dart';
import '../../../../support/style/app_fonts.dart';

abstract class CityItemViewModelProtocol {
  String get name;
  String get details;

  void didTapCity();
}

class CityItemView extends StatelessWidget {
  final CityItemViewModelProtocol viewModel;

  const CityItemView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.didTapCity,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.black05, // Cor da borda
            ),
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.details,
                  style: AppFonts.circeLight(18, AppColors.black),
                ),
                Text(
                  viewModel.name,
                  style: AppFonts.circeBold(26, AppColors.black),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
