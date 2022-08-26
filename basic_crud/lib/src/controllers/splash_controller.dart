
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    _initTimer();
  }

  void _initTimer() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed('/home_page')
    );
  }

}