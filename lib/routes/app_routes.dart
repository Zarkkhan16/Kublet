import 'package:flutter/material.dart';
import 'package:kublet/presentation/apps_configuration_page/apps_configuration_page.dart';
import 'package:kublet/presentation/found_device_one_screen/found_device_screen.dart';
import 'package:kublet/presentation/home_container_screen/apps_detail_screen/sekected_app_detail_screen.dart';
import 'package:kublet/presentation/set_up_screen/set_up_screen.dart';
import 'package:kublet/presentation/scanning_screen/scanning_screen.dart';
import 'package:kublet/presentation/home_container_screen/home_container_screen.dart';
import 'package:kublet/presentation/sync_screen/sync_screen.dart';
import 'package:kublet/presentation/settings_screen/settings_screen.dart';
import 'package:kublet/presentation/wifi_naming_screen/wifi_naming_screen.dart';
import 'package:kublet/presentation/wifi_password_screen/wifi_password_screen.dart';
import 'package:kublet/presentation/wifi_screen/wifi_screen.dart';
import 'package:kublet/presentation/about_screen/about_screen.dart';

class AppRoutes {
  static const String foundDeviceScreen = '/found_device_screen';

  static const String setUpScreen = '/set_up_screen';

  static const String scanningScreen = '/scanning_screen';


  static const String homeTabContainerPage = '/home_tab_container_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String AppsDetail = '/apps_detail_screen';

  static const String appsConfigurationScreen = '/selected_app_page';

  static const String syncScreen = '/sync_screen';

  static const String settingsScreen = '/settings_screen';

  static const String wifiScreen = '/wifi_screen';

  static const String wifiNamingScreen = '/wifi_naming_screen';

  static const String wifiPasswordScreen = '/wifi_password_screen';

  static const String aboutScreen = '/about_screen';



  static Map<String, WidgetBuilder> routes = {
    setUpScreen: (context) => SetUpScreen(),///
    scanningScreen: (context) => ScanningScreen(),///
    foundDeviceScreen: (context) => FoundDeviceScreen(),///
    homeContainerScreen: (context) => HomeContainerScreen(),///
    appsConfigurationScreen: (context) => AppsConfigurationScreen(),///
    AppsDetail: (context) => SelectedAppsDetailScreen(),///
    syncScreen: (context) => SyncScreen(),///
    settingsScreen: (context) => SettingsScreen(),///
    wifiScreen: (context) => WifiScreen(),///
    wifiNamingScreen: (context) => WifiNamingScreen(),///
    wifiPasswordScreen: (context) => WifiPasswordScreen(),///
    aboutScreen: (context) => AboutScreen(),///
  };
}
