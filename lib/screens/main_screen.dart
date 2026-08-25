import 'package:employee_directory/models/employee_model.dart';
import 'package:employee_directory/screens/employees_screen.dart';
import 'package:employee_directory/services/employee_service_dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  new({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isFetching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: isFetching
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () async {
                      setState(() {
                        isFetching = true;
                      });

                      List<EmployeeModel> employees = await EmployeeServiceDio()
                          .getEmployeesData();
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
