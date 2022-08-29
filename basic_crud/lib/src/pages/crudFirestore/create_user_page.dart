
import 'package:basic_crud/src/controllers/firestore/create_user_controller.dart';
import 'package:basic_crud/src/validations/validations.dart';
import 'package:basic_crud/src/widgets/buttons/custom_button.dart';
import 'package:basic_crud/src/widgets/text/custom_text.dart';
import 'package:basic_crud/src/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:basic_crud/src/utils/utils.dart' as utils;
import 'package:basic_crud/src/theme/theme.dart' as th;

class CreateUserPage extends StatelessWidget{
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: _bodyCrud(),
      ),
    );
  }

  Widget _bodyCrud() {
    return GetBuilder<CreateUserController>(
      init: CreateUserController(),
      builder: (_) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Form(
          key: _.gxFormKey,
          child: Column(
            children: [
              _inputName(_.gxNameCtrl),
              _inputAge(_.gxAgeCtrl),
              _inputEmail(_.gxEmailCtrl),
              _inputPhone(_.gxPhoneCtrl),
              _buton(_.gxisUserEdit, _.createOrEditUser)
            ]
          )
        )
      )
    );
  }

  Widget _inputName(TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
      child: CustomTextField(
        textLabel: 'Nombre',
        fieldController: _controller,
        capitalization: TextCapitalization.words,
        validation: (value) => Validations.validRequiredAndLength(value)
      ),
    );
  }

  Widget _inputAge(TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: CustomTextField(
        textLabel: 'Edad',
        fieldController: _controller,
        typeKeyboard: TextInputType.number,
        validation: (value) => Validations.validRequiredAndLength(value)
      ),
    );
  }

  Widget _inputEmail(TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: CustomTextField(
        textLabel: 'Email',
        fieldController: _controller,
        typeKeyboard: TextInputType.emailAddress,
        validation: (value) => Validations.validEmail(value!)
      ),
    );
  }

  Widget _inputPhone(TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: CustomTextField(
        textLabel: 'Teléfono',
        fieldController: _controller,
        typeKeyboard: TextInputType.phone,
        validation: (value) => Validations.validRequiredAndLength(value, 10)
      ),
    );
  }

  Widget _buton(bool _isUserEdit, Future<void> Function() _createOrUpdateUser) {
    return CustomButton(
      width: utils.porcientoW(Get.context, 13.0),
      bgColor: th.primaryColor,
      splashColor: th.secondaryColor.withOpacity(0.4),
      childWidget: CustomText(
        fTxt: (_isUserEdit) ? 'ACTUALIZAR' : 'CREAR USUARIO',
        fSize: 17.0,
        fColor: Colors.white,
      ),
      btnFunction: _createOrUpdateUser
    );
  }

}

