
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WifiPasswordState extends Equatable {
  WifiPasswordState({
    this.ssidController,
    this.passwordController,
  });


  TextEditingController? ssidController;

  TextEditingController? passwordController;


  @override
  List<Object?> get props => [
        ssidController,
        passwordController,
      ];

  WifiPasswordState copyWith({
    TextEditingController? ssidController,
    TextEditingController? passwordController,
  }) {
    return WifiPasswordState(
      ssidController: ssidController ?? this.ssidController,
      passwordController:
          passwordController ?? this.passwordController,
    );
  }
}
