// import 'package:flutter/material.dart';
// import 'package:kublet/routes/app_routes.dart';
// import 'package:kublet/widgets/custom_bottom_bar.dart';
//
// class BottomBArHelper
// {
//
//   static buildBottomBar(BuildContext context) {
//     GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//
//     return CustomBottomBar(onChanged: (BottomBarEnum type) {
//       print(type);
//       Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
//     });
//   }
//
//
//   static getCurrentRoute(BottomBarEnum type) {
//     switch (type) {
//       case BottomBarEnum.Home:
//         return AppRoutes.homeTabContainerPage;
//       case BottomBarEnum.Mykublets:
//         return "/";
//       case BottomBarEnum.Settings:
//         return AppRoutes.selectedAppPage;
//       default:
//         return "/";
//     }
//   }
// }