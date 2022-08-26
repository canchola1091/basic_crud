
import 'package:basic_crud/src/data/global_preferences.dart';
import 'package:basic_crud/src/models/employees_model.dart';
import 'package:basic_crud/src/services/employees_services.dart';
import 'package:basic_crud/src/widgets/alerts/alert_logout.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:basic_crud/src/utils/utils.dart' as utils;
import 'package:get/route_manager.dart';

class EmployeesController extends GetxController {

  final GlobalPreferences _globalPreferences = GlobalPreferences();
  late EmployeesModel? _employeesModel;
  bool _loadingEmployees = true;
  bool _hasError = false;

  //? GETTER
  GlobalPreferences get gxGlobalPreferences => _globalPreferences;
  EmployeesModel? get gxEmployeedModel      => _employeesModel;
  bool get gxLoadingEmployees               => _loadingEmployees;
  bool get gxHasError                       => _hasError;

  @override
  void onInit() {
    super.onInit();
    _globalPreferences.isSession = true;
  }

  @override
  void onReady() async{
    super.onReady();
    await gxGetEmployees();
  }

  //==========================================================
  /// CONSUME ENDPOINT DE LISTA DE EMPLEADOS
  //==========================================================
  Future<void> gxGetEmployees() async {
    _employeesModel = await EmployeesServices().serviceGetEmployees();
    if(_employeesModel == null) _hasError = true;
    _loadingEmployees = false;
    update(['list-employees']);
  }

  //==========================================================
  /// INTENTA OBTENER DE NUEVO LA LISTA DE EMPLEADOS SI HUBO UN ERROR
  //==========================================================
  Future<void> tryGetEmployees() async{
    _loadingEmployees = true;
    _hasError = false;
    update(['list-employees']);
    await gxGetEmployees();
  }

  //==========================================================
  /// MUESTRA ALERTA DE CIERRE DE SESIÓN
  //==========================================================
  Future<void> showAlertLogOut() async{
    utils.msginfo('--> Cerrando sesión...');
    Get.dialog( AlertLogOut(
      fnDone: () {
        _globalPreferences.isSession = false;
        Get.offAllNamed('/user_page');
      },
      fnCancel: () => Get.back()
    ));
  }  

}