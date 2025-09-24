import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart';

import 'app.dart';
import 'config/env.dart';
import 'config/flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure URL strategy for web
  if (kIsWeb) {
    // Use path-based routing instead of hash routing
    // This is handled by go_router automatically in newer versions
  }

  // Initialize Hive
  await Hive.initFlutter();

  runApp(
    ProviderScope(
      child: KendrixApp(
        flavor: Flavor.development,
      ),
    ),
  );
}