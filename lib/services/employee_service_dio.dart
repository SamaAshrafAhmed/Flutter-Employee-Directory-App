import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:employee_directory/models/employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeServiceDio {
  Dio dio = Dio();
  Future<List<EmployeeModel>> getEmployees() async {
    List<EmployeeModel> employees = [];
    String url = "https://dummy.restapiexample.com/api/v1/employees";
    try {
      Response response = await dio.get(url);
      Map<String, dynamic> jsonData = response.data;
      var cachedData = jsonEncode(jsonData);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("employeesData", cachedData);
      List<dynamic> employeesList = jsonData["data"];
      for (var json in employeesList) {
        employees.add(EmployeeModel.fromJson(json));
      }
    } on Exception catch (e) {
      print('Error fetching employees: $e');
      rethrow;
    }
    return employees;
  }

  Future<List<EmployeeModel>> getEmployeesData() async {
    List<EmployeeModel> employees = [];
    try {
      var prefs = await SharedPreferences.getInstance();
      var data = prefs.getString("employeesData");
      if (data == null) {
        employees = await getEmployees();
      } else {
        List<dynamic> employeesList = jsonDecode(data)["data"];
        for (var json in employeesList) {
          employees.add(EmployeeModel.fromJson(json));
        }
        print("this data is cached");
      }
    } on Exception catch (e) {
      print('Error fetching employees: $e');
    }

    return employees;
  }
}
