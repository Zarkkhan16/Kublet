import 'package:equatable/equatable.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/data/enum/data_response_enum.dart';
import 'package:kublet/data/models/apps/app_model.dart';
import 'package:kublet/data/models/response_model/data_response_model.dart';
import 'package:kublet/presentation/home_page/models/apps_model/apps_list_model.dart';
import 'package:kublet/services/apps_services/apps_service.dart';

part 'home_state.dart';

final homeNotifier = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(
    HomeState(
      appsResponse: DataResponseModel<AppsListModel>(DataResponseType.loading),
    ),
  ),
);

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(HomeState state) : super(state);





  Future<void> setApps() async {
    try {
      final response = await AppsService.getApps();

      if (response.apps.isEmpty) {
        state = state.copyWith(
          appsResponse:
              DataResponseModel<AppsListModel>(DataResponseType.empty),
        );
      } else {
        state = state.copyWith(
          appsResponse: DataResponseModel<AppsListModel>(
            DataResponseType.data,
            dataResponse: response,
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(
        appsResponse: DataResponseModel<AppsListModel>(
          DataResponseType.error,
          message: e.toString(),
        ),
      );
    }
  }


  void setSelectedApp(AppModel appModel) =>
      state = state.copyWith(selectedApp: appModel);

  void onTapTitle(String routeName,) =>
      NavigatorService.pushNamed(routeName);
}
