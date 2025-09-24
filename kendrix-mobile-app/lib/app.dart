import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/flavors.dart';
import 'core/i18n/l10n.dart';
import 'core/routing/app_router.dart';
import 'core/theme/theme.dart';

class KendrixApp extends ConsumerWidget {
  const KendrixApp({
    super.key,
    required this.flavor,
  });

  final Flavor flavor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: flavor.appName,
      debugShowCheckedModeBanner: !flavor.isProduction,
      
      // Routing
      routerConfig: router,
      
      // Theme
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      
      // Localization
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      
      // Builder for global error handling
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
    );
  }
}