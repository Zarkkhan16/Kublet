import 'package:equatable/equatable.dart';
import 'package:kublet/presentation/my_kublets_screen/models/my_kublets_model.dart';
import '/core/app_export.dart';
part 'my_kublets_state.dart';

final selectedAppOneNotifier = StateNotifierProvider<MyKubletsNotifier,
        MyKubletsState>(
    (ref) => MyKubletsNotifier(
        MyKubletsState(myKubletsModelObj: MyKubletsModel())));

class MyKubletsNotifier extends StateNotifier<MyKubletsState> {
  MyKubletsNotifier(MyKubletsState state) : super(state);
}
