import 'package:flutter/material.dart';

import 'forecast_item/forecast_item_view.dart';

class ForecastSection extends StatelessWidget {
  final List<ForecastItemViewModelProtocol> forecastViewModels;
  const ForecastSection({required this.forecastViewModels, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: ListView.builder(
          itemCount: forecastViewModels.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (_, index) {
            final forecastViewModel = forecastViewModels[index];

            return ForecastItemView(viewModel: forecastViewModel);
          }),
    );
  }
}
