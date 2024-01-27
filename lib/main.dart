import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import 'features/home/home_view_controller.dart';
import 'localization/localize.dart';
import 'support/utils/service_locator/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();

  runApp(
    MaterialApp(
      home: const HomeViewController(),
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
    ),
  );
}
