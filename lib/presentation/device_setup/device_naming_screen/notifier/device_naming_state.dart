
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DeviceNamingState extends Equatable {
  DeviceNamingState({
    this.deviceNameController,
  });

  TextEditingController? deviceNameController;



  @override
  List<Object?> get props => [
        deviceNameController,

      ];

  DeviceNamingState copyWith({
    TextEditingController? wifiNameController,

  }) {
    return DeviceNamingState(
      deviceNameController:
          wifiNameController ?? this.deviceNameController,
    );
  }
}
