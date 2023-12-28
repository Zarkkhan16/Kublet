import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';


var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),

    PrefUtils().init()
  ]).then((value) {
    runApp(ProviderScope(child: MyApp()));
  });

}

class MyApp extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'kublet',
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizationDelegate(),
          ],
          supportedLocales: [
            Locale(
              'en',
              '',
            ),
          ],
          // home: StocksScreen(),
          initialRoute: AppRoutes.setUpScreen,
          // initialRoute: AppRoutes.foundDeviceScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
