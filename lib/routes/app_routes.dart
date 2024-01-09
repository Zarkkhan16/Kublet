import 'package:flutter/material.dart';
import 'package:kublet/presentation/apps_configuration_page/apps_configuration_page.dart';
import 'package:kublet/presentation/device_setup/device_naming_screen/device_naming_screen.dart';
import 'package:kublet/presentation/device_setup/scanning_screen/scanning_screen.dart';
import 'package:kublet/presentation/device_setup/set_up_screen/set_up_screen.dart';
import 'package:kublet/presentation/device_setup/wifi_screen/wifi_screen.dart';
import 'package:kublet/presentation/edit_wifi_screen/edit_wifi_screen.dart';
import 'package:kublet/presentation/home_container_screen/apps_detail_screen/selected_app_detail_screen.dart';
import 'package:kublet/presentation/home_container_screen/home_container_screen.dart';
import 'package:kublet/presentation/splash_screen/splash_screen.dart';
import 'package:kublet/presentation/sync_screen/sync_screen.dart';
import 'package:kublet/presentation/settings_screen/settings_screen.dart';
import 'package:kublet/presentation/about_screen/about_screen.dart';

class AppRoutes {

  static const String splashScreen = '/splash_screen';
  static const String setUpScreen = '/set_up_screen';

  static const String scanningScreen = '/scanning_screen';


  static const String homeTabContainerPage = '/home_tab_container_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String AppsDetail = '/apps_detail_screen';

  static const String appsConfigurationScreen = '/selected_app_page';

  static const String syncScreen = '/sync_screen';

  static const String settingsScreen = '/settings_screen';

  static const String editWifiScreen = '/edit_wifi_screen';

  static const String deviceNamingScreen = '/device_naming_screen';

  static const String wifiScreen = '/wifi_screen';

  static const String aboutScreen = '/about_screen';



  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),///
    setUpScreen: (context) => SetUpScreen(),///
    scanningScreen: (context) => ScanningScreen(),///
    homeContainerScreen: (context) => HomeContainerScreen(),///
    appsConfigurationScreen: (context) => AppsConfigurationScreen(),///
    AppsDetail: (context) => SelectedAppsDetailScreen(),///
    syncScreen: (context) => SyncScreen(),///
    settingsScreen: (context) => SettingsScreen(),///
    editWifiScreen: (context) => EditWifiScreen(),///
    deviceNamingScreen: (context) => DeviceNamingScreen(),///
    wifiScreen: (context) => WifiScreen(),///
    aboutScreen: (context) => AboutScreen(),///
  };
}
