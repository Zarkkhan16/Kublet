import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/settings_screen/models/settings_model.dart';
part 'settings_state.dart';

final settingsNotifier = StateNotifierProvider<SettingsNotifier, SettingsState>(
    (ref) =>
        SettingsNotifier(SettingsState(settingsModelObj: SettingsModel())));

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier(SettingsState state) : super(state);
}
