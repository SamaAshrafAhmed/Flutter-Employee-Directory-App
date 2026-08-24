class EmployeeModel {
  final int id;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;

  new({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
  });

  factory EmployeeModel.fromJson(json) {
    return EmployeeModel(
      id: json["id"],
      employeeName: json["employee_name"],
      employeeSalary: json["employee_salary"],
      employeeAge: json["employee_age"],
    );
  }
}
