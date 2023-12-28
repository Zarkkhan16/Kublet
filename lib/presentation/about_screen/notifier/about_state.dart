part of 'about_notifier.dart';

class AboutState extends Equatable {
  AboutState({this.aboutModelObj});

  AboutModel? aboutModelObj;

  @override
  List<Object?> get props => [
        aboutModelObj,
      ];

  AboutState copyWith({AboutModel? aboutModelObj}) {
    return AboutState(
      aboutModelObj: aboutModelObj ?? this.aboutModelObj,
    );
  }
}
