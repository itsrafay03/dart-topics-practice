import 'dart:async';

import 'employee.dart';
// Dynamic Function Execution.
// Dynamic function execution means calling a function at runtime, where the function being called may not be known until
// the code is already running — and it might be stored in a variable, passed as an argument, or returned from another function.
// It’s when you store a function in a variable or pass it around just like data — and then call it later without hardcoding the function name.

void main(List<String> args) {
  print(employees);
  sortEmployeeyAge(employees);
  print(employees);
}

// type inference of employee list and make it run time constant due to "final" keyword.
final employees = [
  Employee(name: 'Ali', age: 25, salary: 10000, scale: 16),
  Employee(name: "Farhan", age: 20, salary: 15000, scale: 17),
  Employee(name: 'Waqas', age: 17, salary: 17000, scale: 12),
  Employee(name: 'Usman', age: 19, salary: 20000, scale: 18),
  Employee(name: 'Hasnain', age: 21, salary: 21000, scale: 19),
];

// Function for bubble sorting employee list by Age in Ascending order.
void sortEmployeeyAge(List<Employee> employeesList){
  for (var i = 0; i < employeesList.length; i++) {
    for (var j = 0; j < employeesList.length - i - 1; j++) {
      if(employeesList[j].age > employeesList[j + 1].age){
        //Swapping 
        Employee temp = employeesList[j];
        employeesList[j] = employeesList[j + 1];
        employeesList[j + 1] = temp;
      }
    }
  }
}

