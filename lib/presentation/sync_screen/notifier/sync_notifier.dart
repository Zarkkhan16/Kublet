import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/sync_screen/models/sync_model.dart';
part 'sync_state.dart';

final syncNotifier = StateNotifierProvider<SyncNotifier, SyncState>(
    (ref) => SyncNotifier(SyncState(syncModelObj: SyncModel())));

/// A notifier that manages the state of a Sync according to the event that is dispatched to it.
class SyncNotifier extends StateNotifier<SyncState> {
  SyncNotifier(SyncState state) : super(state);
}
