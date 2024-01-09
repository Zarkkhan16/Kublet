import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
part 'sync_state.dart';

final syncNotifier = StateNotifierProvider<SyncNotifier, SyncState>(
    (ref) => SyncNotifier(SyncState()));

class SyncNotifier extends StateNotifier<SyncState> {
  SyncNotifier(SyncState state) : super(state);


}
