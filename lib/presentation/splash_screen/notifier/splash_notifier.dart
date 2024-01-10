import 'package:kublet/presentation/splash_screen/notifier/splash_state.dart';
import 'package:kublet/services/sq_lite_service/device_sq_lite_service.dart';
import 'package:kublet/services/sq_lite_service/wifi_sq_lite_service.dart';

import '/core/app_export.dart';

final splashNotifier = StateNotifierProvider<SplashNotifier, SplashState>(
    (ref) => SplashNotifier(SplashState()));

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier(SplashState state) : super(state);
  final _deviceSqLiteService = DeviceSqliteService();


  void onTapScreenTitle(String routeName) =>
      NavigatorService.pushNamedAndRemoveUntil(routeName);


  Future<void> checkExitingKublet() async {
    var list=await _deviceSqLiteService.getDeviceList();
    // var list2=await WifiSqliteService().getWifi();
    //

    if (list.isNotEmpty) {
      onTapScreenTitle(AppRoutes.homeContainerScreen);
      return;
    } else {
      onTapScreenTitle(AppRoutes.setUpScreen);

      return;
    }
  }
}
