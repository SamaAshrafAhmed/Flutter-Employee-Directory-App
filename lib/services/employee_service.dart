import 'dart:convert' as convert;

import 'package:employee_directory/models/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  new();
  Future<List<EmployeeModel>> getEmployees() async {
    List<EmployeeModel> employees = [];
    var url = Uri.https('dummy.restapiexample.com', '/api/v1/employees');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> employeesList = jsonResponse['data'];
      for (var employee in employeesList) {
        employees.add(EmployeeModel.fromJson(employee));
        print(employees[employees.length - 1]);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return employees;
  }
}
