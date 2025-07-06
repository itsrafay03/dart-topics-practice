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
  print(employees);   // Simple display list of employees.
  // sortEmployeeyAge(employees);    // It will sort the employees list in ascending order.
  // print(employees);   // Now show the sorted list of employees.

  // Dynamic Function Execution Approch.
  // Now before calling the sort() function we have to make a function which take two Object type parameters and return bool value.
  // Because we have to give that function in sort() function call as it needs Comparable type parameter.
  // So here we will make function to sort age wise. ut as we have to give it as actual parameter in place of Comparable so it has same signature and RDT as Comparable type required.
  // Local Function.(A function which declare within another function)
  bool isAgeWiseCompare(Object o1, Object o2) {
    return (o1 as Employee).age > (o2 as Employee).age;
  }
  sort(employees, isAgeWiseCompare); // sort() is called for age wise sorting.
  print(employees);

  // Similarly Scale wise sorting. Call of Global Function.
  sort(employees, isScaleWiseCompar);
  print(employees);

  // Local Anonymous Function.(Local function with No function identifier)
  // As we need to call this local function only once here in parameter of sort() function so we prefer to make it local anonymous function where it has to be used.
  // And the Comparable will get the reference of this function so all this things work properly, only syntax become short.
  sort(employees, (Object o1, Object o2){
    return (o1 as Employee).salary > (o1 as Employee).salary;
  });
  print(employees);

  // To make syntax more shorter we can return the statement of Local Anonymous function by using Fat Arrow function or Inline function or Lambda function (=>)
  // As this function only return single statement, so there is no need to use compound statement operator {} here.
  sort(employees, (Object o1, Object o2) => (o1 as Employee).salary > (o2 as Employee).salary);

  // No need to tell the D.T of parameters of local function. As they are already defined in typedef so it will know what is the D.T of parameters as Comparable type function is needed here.
  sort(employees, (o1, o2) => (o1 as Employee).salary > (o2 as Employee).salary);
  // It is similar to that as below we just give the parameters without their D.T because their D.T is already defined in type def.
  Comparable comp =(p0, p1) => true;
  // Above we see that p0 and p1 are Object type, as defined above. 

  // Now as we use type inference so D.T of com is not defined so here a and b will be of Dynamic type as no specific type is defined for them.
  var com = (a, b) => false;   
  
  // We can not write D.T in functions as.
    sort(employees, (o1, o2){
    return (o1 as Employee).salary > (o1 as Employee).salary;
  });

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
