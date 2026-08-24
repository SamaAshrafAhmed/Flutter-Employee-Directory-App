import 'package:employee_directory/models/employee_model.dart';
import 'package:employee_directory/screens/employees_screen.dart';
import 'package:employee_directory/services/employee_service_dio.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                List<EmployeeModel> employees = await EmployeeServiceDio()
                    .getEmployees();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EmployeesScreen(employees: employees);
                    },
                  ),
                );
              },
              child: Text("Get Employees"),
            ),
          ),
        ],
      ),
    );
  }
}
