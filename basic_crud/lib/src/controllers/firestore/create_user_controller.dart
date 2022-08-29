
import 'package:basic_crud/src/models/firestore/user_model.dart';
import 'package:basic_crud/src/widgets/alerts/snackbar_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class CreateUserController extends GetxController {

  final GlobalKey<FormState> _formKey        = GlobalKey<FormState>();
  final TextEditingController _nameUserCtrl  = TextEditingController();
  final TextEditingController _ageUserCtrl   = TextEditingController();
  final TextEditingController _emailUserCtrl = TextEditingController();
  final TextEditingController _phoneUserCtrl = TextEditingController();
  late bool _isUserEdit;
  late String _iduserToEdit;

  //? GETTERS
  GlobalKey<FormState> get gxFormKey    => _formKey;
  TextEditingController get gxNameCtrl  => _nameUserCtrl;
  TextEditingController get gxAgeCtrl   => _ageUserCtrl;
  TextEditingController get gxEmailCtrl => _emailUserCtrl;
  TextEditingController get gxPhoneCtrl => _phoneUserCtrl;
  bool get gxisUserEdit => _isUserEdit;

  //*********************ESTADOS*************************
  @override
  void onInit() {
    super.onInit();
    _isUserEdit = Get.arguments["isEdit"];
    if(_isUserEdit) {
      UserModel _userModel = Get.arguments["userModel"];
      _iduserToEdit = _userModel.id;
      _nameUserCtrl.text   = _userModel.name;
      _ageUserCtrl.text    = _userModel.age.toString();
      _emailUserCtrl.text  = _userModel.email;
      _phoneUserCtrl.text  = _userModel.phone;
    }
  }
  //*******************************************************


  //==========================================================
  /// CREA O EDITA UN USUARIO EXISTENTE
  //==========================================================
  Future<void> createOrEditUser() async{

    final bool _formValid = _formKey.currentState!.validate();
    late DocumentReference<Map<String, dynamic>> _docUser;

    if(_formValid) {
      if(_isUserEdit) {
        _docUser = FirebaseFirestore.instance.collection('users').doc(_iduserToEdit);
      }else {
        _docUser = FirebaseFirestore.instance.collection('users').doc();
      }

      final UserModel _user = UserModel(
        id: _docUser.id,
        name: _nameUserCtrl.text.trim(),
        age: int.parse(_ageUserCtrl.text.trim()),
        email: _emailUserCtrl.text.trim(),
        phone: _phoneUserCtrl.text.trim()
      );

      final json = _user.toJson();

      if(_isUserEdit) {
        _docUser.update(json);
      }else {
        await _docUser.set(json);
      }

      Get.back();
      SnackBarAlert.cSnackBar(
        Icons.check,
        (_isUserEdit) ? 'Usuario actualizado' : 'Usuario agregago'
      );
    }

  }

}