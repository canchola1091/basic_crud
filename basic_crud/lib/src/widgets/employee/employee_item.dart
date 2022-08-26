
import 'package:basic_crud/src/models/employees_model.dart';
import 'package:flutter/material.dart';
import 'package:basic_crud/src/pages/detail_employee_page.dart';
import 'package:basic_crud/src/widgets/text/custom_text.dart';
import 'package:basic_crud/src/theme/theme.dart' as th;
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:get/route_manager.dart';


class ItemEmployee extends StatelessWidget {

  final EmployeesModel? employeesModel;
  final int index;

  const ItemEmployee({
    required this.employeesModel,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: '${employeesModel!.data[index].id}',
        child: CircleAvatar(
          foregroundColor: th.primaryColor,
          child: const Icon(Icons.person_pin)
        )
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomText(
            fTxt: employeesModel!.data[index].id.toString(),
            fSize: 17.0
          ),
          const SizedBox(height: 5.0),
          CustomText(
            fTxt: employeesModel!.data[index].employeeName,
            fSize: 17.0
          )
        ]
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText(
            fTxt: '\$${toCurrencyString(employeesModel!.data[index].employeeSalary.toString())}',
            fSize: 17.0,
            fColor: (employeesModel!.data[index].employeeSalary > 100000)
            ? Colors.green
            : Colors.red
          ),
          const SizedBox(height: 5.0),
          CustomText(
            fTxt: employeesModel!.data[index].employeeAge.toString(),
            fSize: 17.0, 
            fColor: (employeesModel!.data[index].employeeAge > 25 && employeesModel!.data[index].employeeAge < 35)
            ? Colors.green
            : Colors.red
          )
        ],
      ),
      onTap: () => Get.to(
        () => DetailEmployeePage(
          employeeID: employeesModel!.data[index].id,
          employeeName: employeesModel!.data[index].employeeName,
          employeeSalary: employeesModel!.data[index].employeeSalary,
          employeeAge: employeesModel!.data[index].employeeAge
        )
      )
    );
  }
}