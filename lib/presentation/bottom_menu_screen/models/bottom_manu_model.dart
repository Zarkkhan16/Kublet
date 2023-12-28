import 'package:equatable/equatable.dart';
import 'package:kublet/data/enum/bottom_bar_enum.dart';


class BottomMenuModel extends Equatable {
  final String icon;
  final String activeIcon;
  final String? title;
  final BottomBarEnum type;

  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  @override
  List<Object?> get props => [icon, activeIcon, title, type];

  BottomMenuModel copyWith({
    String? icon,
    String? activeIcon,
    String? title,
    BottomBarEnum? type,
  }) {
    return BottomMenuModel(
      icon: icon ?? this.icon,
      activeIcon: activeIcon ?? this.activeIcon,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }
}
