
part of 'settings_notifier.dart';
class SettingsState extends Equatable {
  SettingsState({this.settingsModelObj});

  SettingsModel? settingsModelObj;

  @override
  List<Object?> get props => [
        settingsModelObj,
      ];

  SettingsState copyWith({SettingsModel? settingsModelObj}) {
    return SettingsState(
      settingsModelObj: settingsModelObj ?? this.settingsModelObj,
    );
  }
}
