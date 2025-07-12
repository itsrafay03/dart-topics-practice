// This file is made to do more practice of properties in Dart.
// Notice that there are multiple setters and getter is only one as there is only need of 1 getter for a private field.
// The setters are multiple as it depends upon functionality that how we are going to set the value of private field.
// The names of property(setters) can be different according to the functionality.

class BankAccount {
  double _balance = 0.0;

  // Getter of datamember. Read only property.
  double get balance => _balance;

  // Setter of datamember. Write only property.
  set deposit(double amount){
    if(amount > 0){
      _balance += amount; 
    }
  }
 
  // Another setter of datamember. Write only property.
  set withDraw(double amount){
    if(amount > 0 && amount <= _balance){
      _balance -= amount;
    }
  }
}