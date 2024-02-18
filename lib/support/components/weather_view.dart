import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class WeatherView extends StatelessWidget {
  final String humidity;
  final String localName;
  final String windSpeed;
  final String description;
  final String errorMessage;
  final String currentTemperature;
  final String feelsLikeTemperature;

  const WeatherView({
    required this.humidity,
    required this.localName,
    required this.windSpeed,
    required this.errorMessage,
    required this.description,
    required this.currentTemperature,
    required this.feelsLikeTemperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              localName,
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
                        style: AppFonts.circeLight(18, AppColors.black),
                      ),
                      Wrap(
                        children: [
                          Text(
                            'Feels like ',
                            style: AppFonts.circeLight(18, AppColors.black),
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
                        humidity,
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
                        windSpeed,
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
    );
  }
}
