import 'package:equatable/equatable.dart';

import '/core/app_export.dart';

part 'set_up_state.dart';

final setUpNotifier = StateNotifierProvider<SetUpNotifier, SetUpState>(
    (ref) => SetUpNotifier(SetUpState()));

class SetUpNotifier extends StateNotifier<SetUpState> {
  SetUpNotifier(SetUpState state) : super(state);

  void onTapScreenTitle(String routeName) =>
      NavigatorService.pushNamed(routeName);
}
