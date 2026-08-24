import 'package:dio/dio.dart';
import 'package:employee_directory/models/employee_model.dart';

class EmployeeServiceDio {
  Dio dio = Dio();
  Future<List<EmployeeModel>> getEmployees() async {
    List<EmployeeModel> employees = [];
    String url = "https://dummy.restapiexample.com/api/v1/employees";
    try {
      Response response = await dio.get(url);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> employeesList = jsonData["data"];
      for (var json in employeesList) {
        employees.add(EmployeeModel.fromJson(json));
      }
    } on Exception catch (e) {
      print('Error fetching employees: $e');
    }
    return employees;
  }
}
