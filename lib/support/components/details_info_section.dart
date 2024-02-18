import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class DetailsInfoSection extends StatelessWidget {
  final String tempMax;
  final String tempMin;
  final String humidity;
  final String windSpeed;

  const DetailsInfoSection({
    required this.tempMax,
    required this.tempMin,
    required this.humidity,
    required this.windSpeed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.arrow_upward),
                    Text(
                      tempMax,
                      style: AppFonts.circeBold(24),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.arrow_downward),
                    Text(
                      tempMin,
                      style: AppFonts.circeBold(24),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'humidity', // TODO: l10n
                      style: AppFonts.circeRegular(18, AppColors.black05),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      humidity,
                      style: AppFonts.circeBold(18, AppColors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'wind', // TODO: l10n
                      style: AppFonts.circeRegular(18, AppColors.black05),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      windSpeed,
                      style: AppFonts.circeBold(18, AppColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
