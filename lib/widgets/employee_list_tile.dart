import 'package:employee_directory/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeListTile extends StatelessWidget {
  const new({super.key, required this.employee});

  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        tileColor: const Color(0x37DEDEDE),
        iconColor: const Color(0xFF355772),
        leading: Text(employee.id.toString()),
        title: Text(employee.employeeName),
        subtitle: Text("Salary: ${employee.employeeSalary}"),
        trailing: Icon(Icons.person),
      ),
    );
  }
}
