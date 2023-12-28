import 'package:equatable/equatable.dart';

class FoundDeviceModel extends Equatable {
  final bool? connecting;

  FoundDeviceModel({ this.connecting});

  FoundDeviceModel copyWith({
    bool? connecting,
  }) {
    return FoundDeviceModel(
      connecting: connecting ?? this.connecting,
    );
  }

  @override
  List<Object?> get props => [connecting];
}
