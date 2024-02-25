import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class MainInfoSection extends StatelessWidget {
  final String localName;
  final String description;
  final String currentTemperature;
  final String feelsLikeTemperature;

  const MainInfoSection({
    required this.localName,
    required this.description,
    required this.currentTemperature,
    required this.feelsLikeTemperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              localName,
              style: AppFonts.circeRegular(18, AppColors.black05),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: FittedBox(
                    child: Text(
                      currentTemperature,
                      style: AppFonts.circeBold(96, AppColors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        description,
                        style: AppFonts.circeRegular(18, AppColors.black05),
                      ),
                      const SizedBox(height: 12),
                      // const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'feels like ', // TODO: l10n
                            style: AppFonts.circeRegular(18, AppColors.black05),
                          ),
                          Text(
                            feelsLikeTemperature,
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
        ],
      ),
    );
  }
}
