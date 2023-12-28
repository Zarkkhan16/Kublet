import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/home_tab_container_page/models/home_tab_container_model.dart';
part 'home_tab_container_state.dart';

final homeTabContainerNotifier =
    StateNotifierProvider<HomeTabContainerNotifier, HomeTabContainerState>(
  (ref) => HomeTabContainerNotifier(HomeTabContainerState(
    homeTabContainerModelObj: HomeTabContainerModel(),
    tabLabels:  [
      "lbl_all".tr,
      "lbl_finance".tr,
      "lbl_social".tr,
      "lbl_productivity".tr,
    ],
    selectedIndex: 0
  )),
);

class HomeTabContainerNotifier extends StateNotifier<HomeTabContainerState> {
  HomeTabContainerNotifier(HomeTabContainerState state) : super(state) {}

  void updateSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

}
