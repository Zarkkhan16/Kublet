import 'package:flutter/material.dart';
import 'package:kublet/presentation/splash_screen/notifier/splash_notifier.dart';
import '/core/app_export.dart';




class SplashScreen extends ConsumerStatefulWidget {


  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends  ConsumerState<SplashScreen>{
  @override
  void initState() {
    checkExistingKublet();
    super.initState();
  }

  checkExistingKublet()
  async {
    await Future.delayed(Duration(seconds: 2));
    ref.read(splashNotifier.notifier).checkExitingKublet();

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 54.v),
          child: Column(
            children: [
              Spacer(flex: 25),
              Text("lbl_kublet".tr, style: theme.textTheme.displayMedium),
              Spacer(flex: 30),
              Text("lbl_app_v_1".tr, style: theme.textTheme.titleMedium),


            ],
          ),
        ),
      ),
    );
  }
}
