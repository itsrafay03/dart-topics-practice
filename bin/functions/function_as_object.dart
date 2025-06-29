// Here is code to show how function is object and of which class.

// Now we make a function named 'sum' so lets see what happened in Dart.
// Compiler will make an implicit class of this function and extend this class from Function class.
// Now function of sum is the object this implicit class.
// The reference of this object(of implicit class) is the function identifier means 'sum' has the reference of the object which is made in heap. 
num sum(num no1, num no2){
  return no1 + no2;
}

void main(List<String> args){
  print("sum is called: ${sum(2, 4)}");    //  sum function is called.
  // As 'sum' has a reference of the object of implicit class of sum function. And Function is parent of this class. So parent can hold the reference of child class object as shown below. 
  Function f = sum;
  // Object is the parent of all classes even a Function class. So here Object class is the parent most class of that implicit class of sum function. So parent can hold the reference of the child class.
  Object o = sum;
  Object o1 = f;

  // As f, o, nad o1 are refering to the same object to whome 'sum' is refering means object of implicit class of sum function. So I think we can call the sum function with f, o, o1 reference variable same as we call sum function with reference variable of 'sum'.
  print(f(1,1));
  // print(o(1,1));
  // print(o1(1,1));
  // Here we get error when we try to call a sum function with Object class reference variable. Why?
  // You can only call a variable like a function if its static type is Function. As Function is a type/class that represents any callable object. Means every class which has a call() function in it, allow to call it's object like a function.
  // Callable object has a method of call() in it's class(Callable class) so we can call the that object as a function.
  // Object class does not have a call() method, and is not callable class, even if it holds a function internally. So we can not call the object of Object calss as function.

  // In Dart, any class that defines a method named call() becomes a callable class. That means its objects can be used like functions.
  Student stu = Student();
  stu("Pakistan");   // Here we call object of class as a function because Student is callable class.

  // This is how callable object is called. ABC object is made and it's reference will go to 'add' reference variable.
  ABC add = ABC();
  print(add(5, 5));
}

// This is a callable Student class as it has a call function. If we make the Student class object then we can call that object as function with same signature as mentioned in call() function.
class Student {
  void call(String data) {
    print(data);
  }
}

// This example sir give to show how an implicit class is made by compiler for the sum function. The call() method in has same signature as that of sum function.
// The name of this implicit class is anonomous 'ABC' but main thing is call method which is of same signature like sum function.
class ABC {
  num call(num no1, num no2){
    return no1 + no2;
  }
}
