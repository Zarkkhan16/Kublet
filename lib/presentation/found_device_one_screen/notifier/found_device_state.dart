import 'package:equatable/equatable.dart';
import 'package:kublet/presentation/found_device_one_screen/models/found_device_model.dart';

class FoundDeviceState extends Equatable {
  FoundDeviceState({this.foundDeviceModelObj});

  FoundDeviceModel? foundDeviceModelObj;

  @override
  List<Object?> get props => [
        foundDeviceModelObj,
      ];

  FoundDeviceState copyWith({FoundDeviceModel? foundDeviceModelObj}) {
    return FoundDeviceState(
      foundDeviceModelObj:
          foundDeviceModelObj ?? this.foundDeviceModelObj,
    );
  }
}
