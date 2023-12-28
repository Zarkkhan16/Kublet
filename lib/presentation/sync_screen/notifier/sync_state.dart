// ignore_for_file: must_be_immutable

part of 'sync_notifier.dart';

/// Represents the state of Sync in the application.
class SyncState extends Equatable {
  SyncState({this.syncModelObj});

  SyncModel? syncModelObj;

  @override
  List<Object?> get props => [
        syncModelObj,
      ];

  SyncState copyWith({SyncModel? syncModelObj}) {
    return SyncState(
      syncModelObj: syncModelObj ?? this.syncModelObj,
    );
  }
}
