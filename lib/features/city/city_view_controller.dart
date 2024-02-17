import 'package:flutter/material.dart';

class CityViewController extends StatefulWidget {
  final String cityName;

  const CityViewController({required this.cityName, super.key});

  @override
  State<CityViewController> createState() => _CityViewControllerState();
}

class _CityViewControllerState extends State<CityViewController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
