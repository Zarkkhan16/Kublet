import 'package:kublet/data/enum/bottom_bar_enum.dart';
import 'package:kublet/presentation/bottom_menu_screen/models/bottom_manu_model.dart';
import 'package:kublet/presentation/bottom_menu_screen/notifier/bottom_menu_state.dart';
import '/core/app_export.dart';

final bottomMenuNotifier =
    StateNotifierProvider<BottomMenuNotifier, BottomMenuState>((ref) =>
        BottomMenuNotifier(
            BottomMenuState(bottomMenuList: [
              BottomMenuModel(
                icon: ImageConstant.homeIcon,
                activeIcon: ImageConstant.homeActiveIcon,
                title: "lbl_home".tr,
                type: BottomBarEnum.Home,
              ),
              BottomMenuModel(
                icon: ImageConstant.bucketIcon,
                activeIcon: ImageConstant.bucketActiveIcon,
                title: "lbl_apps_detail".tr,
                type: BottomBarEnum.AppsDetail,
              ),
              BottomMenuModel(
                icon: ImageConstant.settingIcon,
                activeIcon: ImageConstant.settingIcon,
                title: "lbl_settings".tr,
                type: BottomBarEnum.Settings,
              )
            ])));

class BottomMenuNotifier extends StateNotifier<BottomMenuState> {
  BottomMenuNotifier(BottomMenuState state) : super(state);

  int? selectedIndex = 0;

  void updateIndex(int? value)
  {
    state=state.copyWith(selectedIndex:value);
  }


}
