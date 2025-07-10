import 'driver.dart';
// This file is made to have a void function and we can call Driver class Constructor in it.

void main(List<String> args) {
  // Driver driver1 = Driver(name: 'Ahmad', salary: 35000);
  // Above statement when execute it will show exception at assert statement in constructor of Driver class.
  // Because in assert if salary should be greater then 37000 then it will pass this check and assign to salary datamember but here we give salary 35000 so assert catch it and show exception.

  Driver driver2 = Driver(name: 'Waqar', salary: 37500);  // Now this is correct.
  print(driver2);

  // Here we take age because now Driver class is extend with Person class and we have to give the value of parameter of parent class in the constructor of child class. 
  Driver driver3 = Driver(name: 'Aslam', salary: 120000, age: 27);
}
