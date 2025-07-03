import 'dart:async';
import 'employee.dart';
// Dynamic Function Execution.
// Dynamic function execution means calling a function at runtime, where the function being called may not be known until
// the code is already running — and it might be stored in a variable, passed as an argument, or returned from another function.
// It’s when you store a function in a variable or pass it around just like data — and then call it later without hardcoding the function name.

// typedef of function which take two list objects , compare them and then return true if they need to swap and viceversa.
// For generalization we take here Object class in parameter because now it can accept the list of any type. As Object is the parent of all classes.
typedef Comparable = bool Function(Object, Object);

// void function.
void main(List<String> args) {
  // Simple Approch.
  // print(employees);   // Simple display list of employees.
  // sortEmployeeyAge(employees);    // It will sort the employees list in ascending order.
  // print(employees);   // Now show the sorted list of employees.

  // Dynamic Function Execution Approch.
  // Now before calling the sort() function we have to make a function which take two Object type parameters and return bool value.
  // Because we have to give that function in sort() function call as it needs Comparable type parameter.
  // So here we will make function to sort age wise. ut as we have to give it as actual parameter in place of Comparable so it has same signature and RDT as Comparable type required.
  // Local Function.(A function within a function)
  bool isAgeWiseCompare(Object o1, Object o2) {
    return (o1 as Employee).age > (o2 as Employee).age;
  }

  print(employees);
  sort(employees, isAgeWiseCompare); // sort() is called for age wise sorting.
  print(employees);

  // Similarly Scale wise sorting.
  print(employees);
  sort(employees, isScaleWiseCompar);
  print(employees);
}

// type inference of employee objects list and make it run time constant due to "final" keyword.
final employees = [
  Employee(name: 'Ali', age: 25, salary: 10000, scale: 16),
  Employee(name: "Farhan", age: 20, salary: 15000, scale: 17),
  Employee(name: 'Waqas', age: 17, salary: 17000, scale: 12),
  Employee(name: 'Usman', age: 19, salary: 20000, scale: 18),
  Employee(name: 'Hasnain', age: 21, salary: 21000, scale: 19),
];

// Function for bubble sorting employee list by Age in Ascending order.
// This function will only sort Employees list on age criteria.
void sortEmployeeyAge(List<Employee> employeesList) {
  for (var i = 0; i < employeesList.length; i++) {
    for (var j = 0; j < employeesList.length - i - 1; j++) {
      if (employeesList[j].age > employeesList[j + 1].age) {
        // Swapping
        Employee temp = employeesList[j];
        employeesList[j] = employeesList[j + 1];
        employeesList[j + 1] = temp;
      }
    }
  }
}

// A function which can sort any list on any criteria.
// Due to Object list we can give any type of list in it to sort.
// We take Comparable type function here because to tell us weather we have to swap the 2 elements of list or not.
void sort(List<Object> list, Comparable comparable) {
  for (var i = 0; i < list.length; i++) {
    for (var j = 0; j < list.length - (i + 1); j++) {
      if (comparable(list[j], list[j + 1])) {
        // Swapping
        var temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}

// A Global Function.
bool isScaleWiseCompar(Object o1, Object o2) {
  return (o1 as Employee).scale > (o2 as Employee).scale;
}
