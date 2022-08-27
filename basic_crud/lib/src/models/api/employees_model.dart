// To parse this JSON data, do
//
//     final employeesModel = employeesModelFromJson(jsonString);

import 'dart:convert';

EmployeesModel employeesModelFromJson(String str) => EmployeesModel.fromJson(json.decode(str));

String employeesModelToJson(EmployeesModel data) => json.encode(data.toJson());

class EmployeesModel {

  final List<Employee> data;
  final String message;

  EmployeesModel({
    required this.data,
    required this.message,
  });

  factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
    data   : List<Employee>.from(json["data"].map((x) => Employee.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data"   : List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Employee {

  final int id;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;
  final String profileImage;

  Employee({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id            : json["id"],
    employeeName  : json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge   : json["employee_age"],
    profileImage  : json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id"             : id,
    "employee_name"  : employeeName,
    "employee_salary": employeeSalary,
    "employee_age"   : employeeAge,
    "profile_image"  : profileImage,
  };
}
