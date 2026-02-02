import 'package:flutter/material.dart';
import 'package:flutter_challenge_model/core/routes/routes.dart';
import 'package:flutter_challenge_model/core/storage/local_storage.dart';
import 'package:flutter_challenge_model/core/theme/theme.dart';
import 'package:flutter_challenge_model/features/settings/presentation/providers/settings_provider.dart';
import 'package:flutter_challenge_model/core/lang/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.shared.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        final settings = ref.watch(settingsProvider);
        return MaterialApp(
          navigatorKey: AppRouter.navigatorKey,
          scaffoldMessengerKey: AppRouter.scaffoldMessengerKey,
          localizationsDelegates: const [
            Applang.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Applang.delegate.supportedLocales,
          locale: settings.locale,
          debugShowCheckedModeBanner: false,
          title: "Clean Architecture Riverpod",
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: settings.themeMode,
          initialRoute: AppRouter.initialRoute,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
