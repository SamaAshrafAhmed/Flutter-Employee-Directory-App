import 'package:flutter/material.dart';

class EmployeeInfo extends StatelessWidget {
  const new({super.key, required this.info});

  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(215, 230, 244, 255),
        ),
        child: Text(info, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
