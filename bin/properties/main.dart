import 'student.dart';
import 'bank_account.dart';
// This file is like main class of java that it has main() function and we are making objects in it.
// Basically we are observing the behaviour of properties(getter-setter) in this file.

void main(List<String> args) {
  // We can see below that property is accessible as datamember.
  Student student1 = Student();
  print(student1.rollNo); // Getter is used here.
  student1.rollNo = 22; // Setter is used here.
  print(student1.rollNo);
  // So compiler check that when the rollno is on left side of the assignment operator(=) then it call the setter, otherwise it always call getter.
  // As proved above that in 'student1.rollNo' getter is called and in 'student1.rollNo = -2' setter is called.

  // Now it will throw Exception as according to the abstraction -ve value can not be set in rollNo.
  // student1.rollNo = -2;

  print('BankAccount');
  BankAccount account = BankAccount();
  print(account.balance); // getter is called
  account.deposit = 1000; // setter is called
  print(account.balance); // getter is called
  account.withDraw = 100; // setter is called
  print(account.balance); // getter is called
  // print(account.withdraw);  // Show Error at withdraw because it is write only property.
  // The error message is that getter with this name is not available, which is true.
}
