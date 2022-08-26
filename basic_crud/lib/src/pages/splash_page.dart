
import 'package:basic_crud/src/controllers/splash_controller.dart';
import 'package:basic_crud/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(size: 200.0),
              SizedBox(height: 30.0),
              CustomText(
                fTxt: 'SPLASH SCREEN',
                fSize: 25.0,
              )
            ]
          )
       )
      )
    );
  }
}