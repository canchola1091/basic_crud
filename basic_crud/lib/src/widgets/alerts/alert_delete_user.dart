
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:basic_crud/src/theme/theme.dart' as th;
import 'package:basic_crud/src/utils/utils.dart' as utils;
import 'package:basic_crud/src/widgets/buttons/custom_button.dart';
import 'package:basic_crud/src/widgets/text/custom_text.dart';


class AlertDeleteUser extends StatelessWidget {

  final void Function() fnDone;   // Fucnión para botón de 'ACEPTAR'
  final void Function() fnCancel; // Función para botón de 'ATRAS/CANCELAR'

  const AlertDeleteUser({
    Key? key,
    required this.fnDone,
    required this.fnCancel,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipInX(
      child: AlertDialog(
        scrollable: true,
        insetPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0)
          ),
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          width: utils.porcientoW(Get.context, 70),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  fTxt: '¿Borrar usuario?',
                  fSize: 18.0,
                  fColor: th.primaryColor,
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      width: utils.porcientoW(Get.context, 6.0),
                      bgColor: Colors.white,
                      borderColor: th.primaryColor,
                      childWidget: CustomText(
                        fTxt: 'CANCELAR',
                        fSize: 15.0,
                        fColor: th.primaryColor,
                      ),
                      btnFunction: fnCancel
                    ),
                    CustomButton(
                      width: utils.porcientoW(Get.context, 6.0),
                      bgColor: th.primaryColor,
                      childWidget: const CustomText(
                        fTxt: 'ACEPTAR',
                        fSize: 15.0,
                        fColor: Colors.white,
                      ),
                      btnFunction: fnDone
                    ),
                  ]
                )
              ]
            )
          )
        )
      )
    );
  }
}

