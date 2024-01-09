import 'package:kublet/presentation/splash_screen/notifier/splash_state.dart';

import '/core/app_export.dart';

final splashNotifier = StateNotifierProvider<SplashNotifier, SplashState>(
    (ref) => SplashNotifier(SplashState()));

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier(SplashState state) : super(state);

  void onTapScreenTitle(String routeName) =>
      NavigatorService.pushNamed(routeName);

  Future<void> checkExitingKublet() async {
    String uid = await PrefUtils().getCurrentDeviceUid();
    print("kublet uid");
    print(uid);

    if (uid.isNotEmpty) {
      onTapScreenTitle(AppRoutes.homeContainerScreen);
      return;
    } else {
      onTapScreenTitle(AppRoutes.setUpScreen);

      return;
    }
  }
}
