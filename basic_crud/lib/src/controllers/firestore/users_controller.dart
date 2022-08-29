
import 'package:basic_crud/src/models/firestore/user_model.dart';
import 'package:basic_crud/src/widgets/alerts/alert_delete_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class UsersController extends GetxController {

  //==========================================================
  /// OBTIENE LA LISTA DE USUARIOS
  //==========================================================
  Stream<List<UserModel>> readUsers() {
    return FirebaseFirestore.instance
      .collection('users')
      .snapshots().map((snapshot) => snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList()
    );
  }

  //==========================================================
  /// ELIMINA AL UN USUARIO EN ESPECIFICO
  //==========================================================
  Future<void> _deleteUser(String idUser) async{
    final _docUser = FirebaseFirestore.instance.collection('users').doc(idUser);

    await _docUser.delete();
    Get.back();
  }

  //==========================================================
  /// MUESTRA UN ALERT PARA CONFIRMAR ELIMINAR UN USUARIO
  //==========================================================
  void showAlertDeleteUser(String idUser) {
    Get.dialog(
      AlertDeleteUser(
        fnDone: () => _deleteUser(idUser),
        fnCancel: () => Get.back()
      ),
      barrierDismissible: false
    );
  }

  //****************NAVEGACIONES********************************
  //==========================================================
  /// NAVEGA HACIA LA VISTA DE CREAR USUARIO
  //==========================================================
  void goToCreateUser() => Get.toNamed('/create_user_page', arguments: {"isEdit": false});

  //==========================================================
  /// NAVEGA HACIA LA VISTA DE EDITAR USUARIO
  //==========================================================
  void goToEditUser(UserModel userModel) {
    Get.toNamed('/create_user_page', arguments: {
        "isEdit": true,
        "userModel": userModel
      }
    );
  }
  //************************************************************

}