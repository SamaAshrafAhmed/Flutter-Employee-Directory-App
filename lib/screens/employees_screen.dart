import 'package:employee_directory/models/employee_model.dart';
import 'package:employee_directory/widgets/employee_list_tile.dart';
import 'package:flutter/material.dart';

class EmployeesScreen extends StatelessWidget {
  const new({super.key, required this.employees});
  final List<EmployeeModel> employees;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Employees",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF76A2C6),
      ),
      body: SizedBox(
        height: 700,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: employees.length,
          itemBuilder: (context, index) {
            EmployeeModel employee = employees[index];
            return EmployeeListTile(employee: employee);
          },
        ),
      ),
    );
  }
}
