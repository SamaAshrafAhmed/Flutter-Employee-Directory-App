import 'package:employee_directory/models/employee_model.dart';
import 'package:employee_directory/screens/employees_screen.dart';
import 'package:employee_directory/services/employee_service_dio.dart';
import 'package:flutter/material.dart';

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

                      try {
                        // Load cached or remote data before opening the list screen.
                        List<EmployeeModel> employees =
                            await EmployeeServiceDio().getEmployeesData();
                        if (!context.mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EmployeesScreen(employees: employees);
                            },
                          ),
                        );
                      } catch (_) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Unable to load employees. Please try again.',
                            ),
                          ),
                        );
                      } finally {
                        if (mounted) {
                          setState(() {
                            isFetching = false;
                          });
                        }
                      }
                    },
                    child: Text("Get Employees"),
                  ),
          ),
        ],
      ),
    );
  }
}
