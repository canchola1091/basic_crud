
import 'package:basic_crud/src/data/global_preferences.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomeController extends GetxController {

  final GlobalPreferences _globalPreferences = GlobalPreferences();

  //? GETTERS
  GlobalPreferences get gxGlobalPresf => _globalPreferences;


  //****************NAVEGACIONES********************************
  //==========================================================
  /// NAVEGA HACIA EL API DE EMPLEADOS
  //==========================================================
  void goToApiEployes () => Get.toNamed('/employees_page');

  //==========================================================
  /// NAVEGA HACIA LA VISTA DE CRUD FIRESTORE
  //==========================================================
  void goToCrudFirestore () => Get.toNamed('/users_page');

  //************************************************************


}