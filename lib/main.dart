import 'package:flutter/material.dart';

import 'features/home/home_view_controller.dart';
import 'support/utils/service_locator/service_locator.dart';

void main() {
  initializeDependencies();
  
  runApp(
    const MaterialApp(
      home: HomeViewController(),
    ),
  );
}
