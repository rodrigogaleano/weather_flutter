import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import 'localization/localize.dart';
import 'router/mobile_router.dart';
import 'support/utils/service_locator/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();

  runApp(
    MaterialApp.router(
      routerConfig: MobileRouter.router,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
    ),
  );
}
