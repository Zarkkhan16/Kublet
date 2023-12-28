import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/home_container_screen/models/home_container_model.dart';
part 'home_container_state.dart';

final homeContainerNotifier =
    StateNotifierProvider<HomeContainerNotifier, HomeContainerState>((ref) =>
        HomeContainerNotifier(
            HomeContainerState(homeContainerModelObj: HomeContainerModel())));

class HomeContainerNotifier extends StateNotifier<HomeContainerState> {
  HomeContainerNotifier(HomeContainerState state) : super(state);
}
