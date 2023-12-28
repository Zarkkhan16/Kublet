import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/set_up_screen/models/set_up_model.dart';
part 'set_up_state.dart';

final setUpNotifier = StateNotifierProvider<SetUpNotifier, SetUpState>((ref) =>
    SetUpNotifier(SetUpState(setUpModelObj: SetUpModel()))
);

class SetUpNotifier extends StateNotifier<SetUpState> {
  SetUpNotifier(SetUpState state) : super(state);

  void onTapScreenTitle(String routeName) =>NavigatorService.pushNamed(routeName);


}

