import 'dart:async';

import 'package:flutter/widgets.dart';

class ErrorBoundary {
  ErrorBoundary({
    required Widget child,
    required Widget Function(FlutterErrorDetails details) errorViewBuilder,
    required void Function(Object error, StackTrace stackTrace) onException,
    required bool isReleaseMode,
  }) {
    if (isReleaseMode) {
      ErrorWidget.builder = errorViewBuilder;
    }

    FlutterError.onError = (FlutterErrorDetails details) async {
      if (isReleaseMode) {
         Zone.current.handleUncaughtError(
            details.exception, details.stack ?? StackTrace.current);
      } else {
        FlutterError.presentError(details);
      }
    };

    runZonedGuarded(() {
      WidgetsFlutterBinding.ensureInitialized();
       runApp(child);
    }, onException);
  }
}
