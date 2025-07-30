import 'dart:io';
// This file is continue file of 1st file (asynchronous_programming.dart). Again in this file we understand about Asynchronous programming in dart.
// We have discussed all the basic concepts and important things about Sync and Async programming in previous file. So let's do more implimentation of Async programming.

// main function.
void main(List<String> args) {
  // We have two async functions sum() and avg(). What we do here that we call sum function as it is a async function so it return us a Future so for that futrue we anonymously call then() function which has a closure.
  // This closure has the value which is returned by the sum function in future. Now as a return of closure we call the avg() function in which we pass the value of sum. Again then() of avg() is called because it is a async function.
  // This then also has a closure from which we get the vag value in future and we print it. So we are doing some sort of chaining here that from one function we are calling next function.
  // When it is called so there will be total delay of 5s. As 3s delay for sum() and 2s delay fo avg(). Means total 5s delay because these both functions are chained up, and after that we can see the display on terminal.
  sum(20, 30).then(
    (value) => avg(value, 2).then(
      (value) => print("Average is $value"),
    ),
  );

  // Above are all dummy async functions which we made by ourself and put explicit delay in them. But now we have a real Async function in Dart as following.
  //  We haev file class here which is same as in Java. We give the path of ifle in the constructor of File class and it reads the meta data of that file.
  File file = File('C:\\Users\\itsra\\Documents\\rough textfile.txt');
  // After the object is constructed we call the instance Async functions of File class.
  // The function who is returning a value as template type of Future is a Async function.
  // In these read functions there is a natural delay of nano or milli seconds to read a complete file.
  file.readAsBytes().then(
        (value) => print(value),
      );

  // If this async function complete with error then we write it in try block and handle exception in catch block.
  try {
    file.readAsString().then(
          (value) => print(value),
        );
  } catch (e) {
    print("Exception is catch: $e");
  }
}

// Async functions.
Future<num> sum(num no1, num no2) {
  return Future.delayed(
    const Duration(seconds: 3),
    () => no1 + no2,
  );
}

Future<num> avg(num sumValue, int items) {
  return Future.delayed(
    const Duration(seconds: 2),
    () => sumValue / items,
  );
}

// This is a async function which will return a bool value by using named constructor of Future class Future.value().
Future<bool> foo()async{
  await Future.delayed(const Duration(seconds: 2));
  return Future.value(true);
}