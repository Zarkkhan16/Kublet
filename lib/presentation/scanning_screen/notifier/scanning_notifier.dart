import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/scanning_screen/models/scanning_model.dart';
part 'scanning_state.dart';

final scanningNotifier = StateNotifierProvider<ScanningNotifier, ScanningState>(
    (ref) =>
        ScanningNotifier(ScanningState(scanningModelObj: ScanningModel())));

class ScanningNotifier extends StateNotifier<ScanningState> {
  ScanningNotifier(ScanningState state) : super(state);


  void onTapScreenTitle(String routeName) =>NavigatorService.pushNamed(routeName);
}
