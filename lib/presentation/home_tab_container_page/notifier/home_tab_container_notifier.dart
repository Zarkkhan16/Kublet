import 'package:equatable/equatable.dart';
import 'package:kublet/data/enum/data_response_enum.dart';
import 'package:kublet/data/models/apps/app_model.dart';
import 'package:kublet/data/models/response_model/data_response_model.dart';
import 'package:kublet/services/apps_services/apps_service.dart';

import '/core/app_export.dart';

part 'home_tab_container_state.dart';

final homeTabContainerNotifier =
    StateNotifierProvider<HomeTabContainerNotifier, HomeTabContainerState>(
  (ref) => HomeTabContainerNotifier(
    HomeTabContainerState(
        tagsResponse: DataResponseModel<List<String>>(DataResponseType.loading),
        selectedIndex: 0),
  ),
);

class HomeTabContainerNotifier extends StateNotifier<HomeTabContainerState> {
  HomeTabContainerNotifier(HomeTabContainerState state) : super(state) {}
  List<AppModel>? filteredList;

  void updateSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> setTags() async {
    try {
      List<String> response = await AppsService.getTags();

      if (response.isEmpty) {
        state = state.copyWith(
          tagsResponse: DataResponseModel<List<String>>(DataResponseType.empty),
        );
      } else {
        response.add("all");
        response.sort((a, b) => a.compareTo(b));

        print(response);
        state = state.copyWith(
          tagsResponse: DataResponseModel<List<String>>(
            DataResponseType.data,
            dataResponse: response,
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(
        tagsResponse: DataResponseModel<List<String>>(
          DataResponseType.error,
          message: e.toString(),
        ),
      );
    }
  }
}
