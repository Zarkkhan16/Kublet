part of 'home_notifier.dart';
class HomeState extends Equatable {
  HomeState({
    this.appsResponse,
    this.selectedApp,
  });

  final DataResponseModel<AppsListModel>? appsResponse;

  final AppModel? selectedApp;

  @override
  List<Object?> get props => [ appsResponse, selectedApp];

  HomeState copyWith({
    DataResponseModel<AppsListModel>? appsResponse,
    AppModel? selectedApp,
    final DataResponseModel<List<String>>? tags
  }) {
    return HomeState(
      appsResponse: appsResponse ?? this.appsResponse,
      selectedApp: selectedApp ?? this.selectedApp,

    );
  }
}