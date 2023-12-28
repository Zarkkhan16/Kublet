import 'package:flutter/material.dart';
import 'package:kublet/presentation/set_up_screen/notifier/set_up_notifier.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import '/core/app_export.dart';

class SetUpScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller=ref.read(setUpNotifier.notifier);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 54.v),
          child: Column(
            children: [
              Spacer(flex: 25),
              Text("lbl_kublet".tr, style: theme.textTheme.displayMedium),
              Spacer(flex: 74),
              CustomOutlinedButton(
                onPressed:()=>controller.onTapScreenTitle(AppRoutes.scanningScreen),
                text: "msg_set_up_new_kublet".tr,
              ),
              SizedBox(height: 28.v),
              Text("lbl_app_v_1".tr, style: theme.textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }

}
