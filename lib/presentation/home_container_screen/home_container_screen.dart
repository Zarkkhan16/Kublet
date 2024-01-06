import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/data/enum/bottom_bar_enum.dart';
import 'package:kublet/presentation/bottom_menu_screen/botttom_menu_screen.dart';
import 'package:kublet/presentation/home_container_screen/apps_detail_screen/sekected_app_detail_screen.dart';
import 'package:kublet/presentation/home_tab_container_page/home_tab_container_page.dart';
import 'package:kublet/presentation/settings_screen/settings_screen.dart';

class HomeContainerScreen extends ConsumerStatefulWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  HomeContainerScreenState createState() => HomeContainerScreenState();
}

class HomeContainerScreenState extends ConsumerState<HomeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  BottomBarEnum selectedType = BottomBarEnum.Home;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homeContainerScreen,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, i,_) =>
                        getCurrentPage(context, routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }



  Widget _buildBottomBar(BuildContext context) {
    return BottomMenuScreen(
        onChanged: (type) {
      print(type);
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  String getCurrentRoute(type) {

    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeTabContainerPage;
      case BottomBarEnum.AppsDetail:
        return AppRoutes.AppsDetail;
      case BottomBarEnum.Settings:
        return AppRoutes.settingsScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homeTabContainerPage:
        return HomeTabContainerPage();
      case AppRoutes.settingsScreen:
        return SettingsScreen();
        case AppRoutes.AppsDetail:
        return SelectedAppsDetailScreen();
      default:
        return HomeTabContainerPage();
    }
  }
}
