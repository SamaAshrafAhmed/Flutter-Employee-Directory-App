import 'package:employee_directory/models/employee_model.dart';
import 'package:employee_directory/widgets/employee_Info.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  const new({super.key, required this.employee});
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80, color: const Color(0xFF76A2C6)),
            SizedBox(height: 20),
            Text(
              employee.employeeName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF466075),
              ),
            ),
            SizedBox(height: 40),
            EmployeeInfo(info: "Salary: ${employee.employeeSalary}L.E"),
            EmployeeInfo(info: "Age: ${employee.employeeAge} years old"),
          ],
        ),
      ),
    );
  }
}
