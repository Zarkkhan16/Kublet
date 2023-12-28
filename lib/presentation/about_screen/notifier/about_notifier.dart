import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/about_screen/models/about_model.dart';
part 'about_state.dart';

final aboutNotifier = StateNotifierProvider<AboutNotifier, AboutState>(
    (ref) => AboutNotifier(AboutState(aboutModelObj: AboutModel())));

class AboutNotifier extends StateNotifier<AboutState> {
  AboutNotifier(AboutState state) : super(state);
}
