import 'driver.dart';
// This file is made to have a void function and we can call Driver class Constructor in it.

void main(List<String> args) {
  // Driver driver1 = Driver(name: 'Ahmad', salary: 35000);
  // Above statement when execute it will show exception at assert statement in constructor of Driver class.
  // Because in assert if salary should be greater then 37000 then it will pass this check and assign to salary datamember but here we give salary 35000 so assert catch it and show exception.

  Driver driver2 = Driver(name: 'Waqar', salary: 37500, age: 20);
  print(driver2);
}
