
import 'package:basic_crud/src/models/api/employees_model.dart';
import 'package:basic_crud/src/widgets/alerts/simple_alert.dart';
import 'package:http/http.dart' as http;
import 'package:basic_crud/src/utils/utils.dart' as utils;

class EmployeesServices {

  //==========================================================
  /// OBTENER LISTA DE EMPLEADOS
  //==========================================================
  Future serviceGetEmployees() async {
    utils.msginfo('--> Obteniendo Empleados...');
    final _url = Uri.tryParse('https://dummy.restapiexample.com/api/v1/employees');
    try {
      final _resp = await http.get( _url! );
      // print('--> Resp: ${_resp.body}');
      // print('--> Status: ${_resp.statusCode}');
      if(_resp.statusCode == 200) {
        return employeesModelFromJson(_resp.body);
      }else {
        SimpleAlert().cAlert('Upss!!', 'Ocurrio un error al obtener la lista de empleados.');
        utils.msgerror('Error al obtener la lista de Empleados');
      }
    } catch (e) {
      utils.msgerror('--> CATCH');
      // return null;
    }
  }
}