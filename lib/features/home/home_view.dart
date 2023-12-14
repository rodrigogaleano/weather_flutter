import 'package:flutter/material.dart';

import '../../support/style/app_fonts.dart';
import 'components/circle_info_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              '26°',
              style: AppFonts.poppinsSemiBold(120),
            ),
            Text(
              'NYC',
              style: AppFonts.poppinsSemiBold(92),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleInfoIcon(
                    icon: Icons.water_drop_outlined,
                    label: '54%',
                  ),
                  CircleInfoIcon(
                    icon: Icons.wind_power,
                    label: '5km/h',
                  ),
                  CircleInfoIcon(
                    icon: Icons.thermostat_outlined,
                    label: '30%',
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text('New York'),
          ],
        ),
      ),
    );
  }
}
