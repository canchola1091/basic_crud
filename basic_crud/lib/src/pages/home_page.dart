import 'package:animate_do/animate_do.dart';
import 'package:basic_crud/src/controllers/home_controller.dart';
import 'package:basic_crud/src/widgets/buttons/custom_button.dart';
import 'package:basic_crud/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:basic_crud/src/utils/utils.dart' as utils;
import 'package:basic_crud/src/theme/theme.dart' as th;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const CustomText(
            fTxt: 'CRUD & API',
            fSize: 18.0,
          ),
          centerTitle: true,
        ),
        body: _body(_.goToApiEployes, _.goToCrudFirestore),
      )
    );
  }

  Widget _body(void Function() _goToApiEmployes, void Function() _goToCrudFirestore) {
    return FadeInDown(
      delay: const Duration(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: utils.porcientoW(Get.context, 33.0),
            ),
            const SizedBox(height: 50.0),
            _cButon('API Empleados', _goToApiEmployes),
            const SizedBox(height: 20.0),
            _cButon('CRUD Firebase', _goToCrudFirestore),
          ]
        )
      )
    );
  }

  Widget _cButon(String title, void Function() _onClick) {
    return SizedBox(
      width: utils.porcientoW(Get.context, 55.0),
      child: CustomButton(
        bgColor: th.primaryColor,
        borderRadius: 15.0,
        childWidget: CustomText(
          fTxt: title,
          fSize: 18.0,
          fColor: Colors.white,
        ),
        btnFunction: _onClick
      )
    );
  }

}