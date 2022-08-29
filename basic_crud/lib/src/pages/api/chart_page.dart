
import 'package:animate_do/animate_do.dart';
import 'package:basic_crud/src/controllers/api/employees_controller.dart';
import 'package:basic_crud/src/widgets/text/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:basic_crud/src/utils/utils.dart' as utils;
import 'package:basic_crud/src/theme/theme.dart' as th;
import 'package:get/get.dart';

class ChartPage extends StatelessWidget {

  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeesController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: th.primaryColor,
          title: const CustomText(
            fTxt: 'Salarios',
            fSize: 17.0
          ),
          centerTitle: true,
        ),
        body: FadeInRight(
          from: 50.0,
          delay: const Duration(milliseconds: 300),
          child: Center(
            child: SizedBox(
              width: utils.porcientoW(Get.context, 70.0),
              child: PieChart(
                PieChartData(
                  centerSpaceColor: th.secondaryColor,
                  centerSpaceRadius: utils.porcientoW(Get.context, 18.0),
                  sectionsSpace: 2.0,
                  sections: _.buildSectionChart().toList()
                )
              )
            )
          ),
        )
      )
    );
  }

}