import 'package:flutter/material.dart';

import 'details_info_section.dart';
import 'main_info_section.dart';

class WeatherView extends StatelessWidget {
  final String tempMax;
  final String tempMin;
  final String humidity;
  final String localName;
  final String windSpeed;
  final String description;
  final String errorMessage;
  final String currentTemperature;
  final String feelsLikeTemperature;

  const WeatherView({
    required this.tempMax,
    required this.tempMin,
    required this.humidity,
    required this.localName,
    required this.windSpeed,
    required this.description,
    required this.errorMessage,
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
          MainInfoSection(
            localName: localName,
            description: description,
            currentTemperature: currentTemperature,
            feelsLikeTemperature: feelsLikeTemperature,
          ),
          const Divider(),
          DetailsInfoSection(
            tempMax: tempMax,
            tempMin: tempMin,
            humidity: humidity,
            windSpeed: windSpeed,
          ),
        ],
      ),
    );
  }
}
