
import 'package:basic_crud/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/route_manager.dart';
import 'package:basic_crud/src/theme/theme.dart' as th;
import 'package:basic_crud/src/utils/utils.dart' as utils;

class DetailEmployeePage extends StatelessWidget {

  final int employeeID;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;

  const DetailEmployeePage({
    required this.employeeID,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: th.primaryColor,
        centerTitle: true,
        title: const CustomText(
          fTxt: 'Employee Individual',
          fSize: 20.0
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: _body()
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: utils.porcientoH(Get.context, 5.0)),
          Hero(
            tag: '$employeeID',
            child: CircleAvatar(
              radius: utils.porcientoW(Get.context, 15.0),
              foregroundColor: th.primaryColor,
              child: const Icon(Icons.person_pin, size: 100.0)
            )
          ),
          SizedBox(height: utils.porcientoH(Get.context, 5.0)),
          CustomText(
            fTxt: 'ID: $employeeID',
            fSize: 22.0
          ),
          SizedBox(height: utils.porcientoH(Get.context, 5.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                fTxt: 'Name: $employeeName',
                fSize: 22.0
              ),
              CustomText(
                fTxt: 'Age: $employeeAge',
                fSize: 22.0,
                fColor: (employeeAge > 25 && employeeAge < 35)
                ? Colors.green
                : Colors.red
              )
            ]
          ),
          SizedBox(height: utils.porcientoH(Get.context, 5.0)),
          CustomText(
            fTxt: 'Salary: \$${toCurrencyString(employeeSalary.toString())}',
            fSize: 22.0,
            fColor: (employeeSalary > 100000)
            ? Colors.green
            : Colors.red
          )
        ]
      )
    );
  }

}