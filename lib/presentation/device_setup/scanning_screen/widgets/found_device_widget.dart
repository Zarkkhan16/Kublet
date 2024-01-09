import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/device_setup/scanning_screen/notifier/scanning_notifier.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';

class FoundDeviceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Expanded(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            child: FutureBuilder(
              future: Future.delayed(Duration(seconds: 2)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Consumer(
                    builder: (cxt,ref,_) {
                      final controller = ref.read(scanningNotifier.notifier);

                      final model = ref.watch(scanningNotifier);
                      return Column(
                        children: List.generate(
                            controller.state.scanningModel.deviceList!.length,
                            (i) => CustomOutlinedButton(
                                onPressed: () => controller.updateSelectedDevice(
                                    model.scanningModel.deviceList![i]),
                                text: model.scanningModel.deviceList![i],
                                // text: "lbl_kublet".tr,
                                margin: EdgeInsets.only(top: 20.v),
                                buttonStyle: model.scanningModel.deviceList![i] !=
                                        model.scanningModel.selectedDevice
                                    ? CustomButtonStyles.outlineGray
                                    : CustomButtonStyles.outlineOnPrimary,
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumBlack900)),
                      );
                    }
                  );
                }
              },
            ),
          ),
          Spacer(),
          _buildConnect(context),
        ],
      ),
    );
  }

  _buildConnect(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final scanningState = ref.watch(scanningNotifier);

        return CustomOutlinedButton(
          text: scanningState.scanningModel.connecting == true
              ? "lbl_connecting".tr
              : "Connect".tr,
          onPressed: () => ref
              .read(scanningNotifier.notifier)
              .connectAndMoveToNextScreen(context),
          buttonStyle: scanningState.scanningModel.connecting == true
              ? CustomButtonStyles.outlineGray
              : CustomButtonStyles.outlinePrimary,
        );
      },
    );
  }
}
