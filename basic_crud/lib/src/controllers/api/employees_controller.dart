
import 'package:basic_crud/src/data/global_preferences.dart';
import 'package:basic_crud/src/models/api/employees_model.dart';
import 'package:basic_crud/src/services/employees_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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

  //*********************ESTADOS*************************
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
  //*******************************************************


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
  /// CREA LAS SECCIONES DE LA GRAFICA
  //==========================================================
  List<PieChartSectionData> buildSectionChart() {

    List<PieChartSectionData> listSection = [];

    for (var item in _employeesModel!.data) {
      listSection.add(
        PieChartSectionData(
          value: double.tryParse(item.employeeAge.toString()),
          titlePositionPercentageOffset: 1.5
        )
      );
    }

    return listSection;

  }

}